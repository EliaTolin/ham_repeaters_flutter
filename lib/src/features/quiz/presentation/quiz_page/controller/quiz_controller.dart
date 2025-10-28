import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_request.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/state/quiz_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/delete_quiz_set_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_custom_quiz_set_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_quiz_set_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_topics_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/set_quiz_finished_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  FutureOr<QuizState?> build({ExamType? examType, List<TopicRequest>? topics}) async {
    final userId = await ref.read(getUserIdProvider.future);

    if (userId == null) {
      throw Exception('User ID not found');
    }

    if (examType != null && topics != null) {
      throw Exception('Either examType or topics must be provided');
    }

    if (examType != null) {
      state = const AsyncLoading();
      try {
        state = await AsyncValue.guard(() async {
          final quizSet = await ref.read(
            getQuizSetProvider(
              examType: examType,
              userId: userId,
            ).future,
          );
          final allTopics = await ref.read(getTopicsProvider.future);

          return QuizState(
            quizSet: quizSet,
            currentQuestionIndex: 0,
            answers: {},
            questionTimes: {},
            quizStartTime: DateTime.now(),
            topics: allTopics,
          );
        });
        return state.value;
      } catch (e) {
        state = AsyncError(e, StackTrace.current);
      }
    } else if (topics != null) {
      state = await AsyncValue.guard(() async {
        final quizSet = await ref.read(
          getCustomQuizSetProvider(
            topics: topics,
            userId: userId,
          ).future,
        );
        final allTopics = await ref.read(getTopicsProvider.future);

        return QuizState(
          quizSet: quizSet,
          currentQuestionIndex: 0,
          answers: {},
          questionTimes: {},
          quizStartTime: DateTime.now(),
          topics: allTopics,
        );
      });
      return state.value;
    }
    return null;
  }

  Future<void> answerQuestion(String chosenLetter) async {
    final currentState = state.value;
    if (currentState == null) return;

    final question = currentState.currentQuestion;
    final now = DateTime.now();
    final timeMs = now.difference(currentState.quizStartTime).inMilliseconds;

    // Update local state
    final newAnswers = Map<int, String?>.from(currentState.answers);
    newAnswers[question.id] = chosenLetter;

    final newQuestionTimes = Map<int, int>.from(currentState.questionTimes);
    newQuestionTimes[question.id] = timeMs;

    final newState = currentState.copyWith(
      answers: newAnswers,
      questionTimes: newQuestionTimes,
    );

    state = AsyncValue.data(newState);

    // Save to database
    try {
      final repository = ref.read(quizRepositoryProvider);
      await repository.saveAnswer(
        setId: currentState.quizSet.quizSetId,
        questionId: question.id,
        chosenLetter: chosenLetter,
        timeMs: timeMs,
      );
    } catch (e) {
      // Handle error - could show a snackbar or update error state
      // Error is silently handled to avoid disrupting quiz flow
    }
  }

  void goToNextQuestion() {
    final currentState = state.value;
    if (currentState == null || !currentState.canGoNext) return;

    final newState = currentState.copyWith(
      currentQuestionIndex: currentState.currentQuestionIndex + 1,
    );

    state = AsyncValue.data(newState);
  }

  void goToPreviousQuestion() {
    final currentState = state.value;
    if (currentState == null || !currentState.canGoPrevious) return;

    final newState = currentState.copyWith(
      currentQuestionIndex: currentState.currentQuestionIndex - 1,
    );

    state = AsyncValue.data(newState);
  }

  void goToQuestion(int index) {
    final currentState = state.value;
    if (currentState == null || index < 0 || index >= currentState.totalQuestions) return;

    final newState = currentState.copyWith(
      currentQuestionIndex: index,
    );

    state = AsyncValue.data(newState);
  }

  Future<void> submitQuiz() async {
    final currentState = state.value;
    if (currentState == null || !currentState.canSubmit) return;

    state = AsyncValue.data(currentState.copyWith(isSubmitting: true));

    try {
      await ref.read(setQuizFinishedProvider(currentState.quizSet.quizSetId).future);

      final completedState = currentState.copyWith(
        isSubmitting: false,
        isCompleted: true,
      );
      state = AsyncValue.data(completedState);
    } catch (e) {
      final newState = currentState.copyWith(
        isSubmitting: false,
        errorMessage: 'Failed to submit quiz: $e',
      );
      state = AsyncValue.data(newState);
    }
  }

  Future<void> deleteQuiz() async {
    final currentState = state.value;
    if (currentState == null) return;

    await ref.read(deleteQuizSetProvider(currentState.quizSet.quizSetId).future);
  }
}
