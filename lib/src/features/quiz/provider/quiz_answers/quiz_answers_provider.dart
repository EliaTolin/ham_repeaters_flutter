import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_answers_provider.g.dart';

@riverpod
Future<List<QuizSetQuestionResultModel>> quizAnswers(
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
