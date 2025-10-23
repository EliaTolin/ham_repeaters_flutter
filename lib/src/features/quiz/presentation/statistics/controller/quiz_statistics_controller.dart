import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_statistics_controller.g.dart';

@riverpod
class QuizStatisticsController extends _$QuizStatisticsController {
  @override
  Future<List<QuizSetScore>> build() async {
    return _loadStatistics();
  }

  Future<List<QuizSetScore>> _loadStatistics() async {
    try {
      final repository = ref.read(quizRepositoryProvider);
      return await repository.getAllQuizScores();
    } catch (e) {
      throw Exception('Failed to load quiz statistics: $e');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_loadStatistics);
  }
}
