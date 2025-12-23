import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_answers_provider.g.dart';

@riverpod
Future<List<QuizSetQuestionResult>> quizAnswers(
  Ref ref,
  String setId,
) async {
  try {
    final repository = ref.read(quizRepositoryProvider);
    final result = await repository.getQuizAnswersWithResults(setId).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw Exception('Timeout loading quiz answers');
      },
    );

    return result;
  } catch (e) {
    rethrow;
  }
}
