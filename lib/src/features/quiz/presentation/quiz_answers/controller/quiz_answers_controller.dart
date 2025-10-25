import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_answers_controller.g.dart';

@riverpod
class QuizAnswersController extends _$QuizAnswersController {
  @override
  Future<List<QuizSetQuestionResultModel>> build(String setId) async {
    try {
      print('Loading quiz answers for setId: $setId');
      final repository = ref.read(quizRepositoryProvider);

      final result = await repository.getQuizAnswersWithResults(setId).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          print('Timeout loading quiz answers');
          throw Exception('Timeout loading quiz answers');
        },
      );

      print('Loaded ${result.length} answers');
      return result;
    } catch (e, stackTrace) {
      print('Error loading quiz answers: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
