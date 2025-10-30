import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_results_controller.g.dart';

@riverpod
class QuizResultsController extends _$QuizResultsController {
  @override
  Future<QuizSetScore?> build(String setId) async {
    return _loadQuizResults(setId);
  }

  Future<QuizSetScore?> _loadQuizResults(String setId) async {
    try {
      final repository = ref.read(quizRepositoryProvider);
      return await repository.getQuizResults(setId);
    } catch (e) {
      // Re-throw the error to be handled by the UI
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadQuizResults(setId));
  }
}
