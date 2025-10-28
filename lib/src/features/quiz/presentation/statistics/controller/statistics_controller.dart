import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/state/statistics_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/delete_all_quiz_set_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'statistics_controller.g.dart';

@riverpod
class StatisticsController extends _$StatisticsController {
  @override
  Future<StatisticsState> build() async {
    return _loadStatistics();
  }

  Future<StatisticsState> _loadStatistics() async {
    state = const AsyncValue.loading();

    try {
      final userId = await ref.read(getUserIdProvider.future);

      if (userId == null) {
        throw Exception('User ID not found');
      }

      final repository = ref.read(quizRepositoryProvider);

      // Fetch all data in parallel
      final totalAccuracy = await repository.getUserTotalAccuracy(userId);
      final topicAccuracies = await repository.getUserTopicAccuracy(userId);
      final recentScores = await repository.getRecentQuizScores(limit: 10);

      final newState = StatisticsState(
        totalAccuracy: totalAccuracy,
        topicAccuracies: topicAccuracies,
        recentScores: recentScores,
      );

      state = AsyncValue.data(newState);
      return newState;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final newState = await _loadStatistics();
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteAllQuizSet() async {
    final userId = await ref.read(getUserIdProvider.future);
    if (userId == null) {
      throw Exception('User ID not found');
    }
    await ref.read(deleteAllQuizSetProvider(userId).future);
    await refresh();
  }
}
