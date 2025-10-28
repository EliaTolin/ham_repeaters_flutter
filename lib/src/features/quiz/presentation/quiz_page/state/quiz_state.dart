import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/question.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic.dart';

part 'quiz_state.freezed.dart';

@freezed
abstract class QuizState with _$QuizState {
  const factory QuizState({
    required QuizSetResponse quizSet,
    required int currentQuestionIndex,
    required Map<int, String?> answers, // questionId -> chosenLetter
    required Map<int, int> questionTimes, // questionId -> timeMs
    required DateTime quizStartTime,
    required List<Topic> topics,
    @Default(false) bool isSubmitting,
    @Default(false) bool isCompleted,
    String? errorMessage,
  }) = _QuizState;

  const QuizState._();

  Question get currentQuestion => quizSet.questions[currentQuestionIndex];

  bool get isFirstQuestion => currentQuestionIndex == 0;

  bool get isLastQuestion => currentQuestionIndex == quizSet.questions.length - 1;

  int get totalQuestions => quizSet.questions.length;

  int get answeredQuestions => answers.values.where((answer) => answer != null).length;

  String? get currentAnswer => answers[currentQuestion.id];

  bool get canGoNext => !isLastQuestion;

  bool get canGoPrevious => !isFirstQuestion;

  bool get canSubmit => answeredQuestions == totalQuestions;
}
