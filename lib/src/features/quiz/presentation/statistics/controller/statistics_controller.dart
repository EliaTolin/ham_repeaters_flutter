import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_accuracy/topic_accuracy.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/total_accuracy/total_accuracy.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/state/statistics_state/statistics_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/delete_all_quiz_set/delete_all_quiz_set_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_user_topic_accuracy/get_user_topic_accuracy_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_user_total_accuracy/get_user_total_accuracy_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/recent_quiz_scores/recent_quiz_scores_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'statistics_controller.g.dart';

@riverpod
class StatisticsController extends _$StatisticsController {
  @override
  Future<StatisticsState> build() async {
    final userId = await ref.read(getUserIdProvider.future);

    if (userId == null) {
      throw Exception('User ID not found');
    }
    final totalAccuracy = await ref.read(getUserTotalAccuracyProvider(userId).future);
    final topicAccuracies = await ref.read(getUserTopicAccuracyProvider(userId).future);
    final recentScores = await ref.read(recentQuizScoresProvider(limit: 10).future);
    return _loadStatistics(
      totalAccuracy: totalAccuracy,
      topicAccuracies: topicAccuracies,
      recentScores: recentScores,
    );
  }

  Future<StatisticsState> _loadStatistics({
    required TotalAccuracy? totalAccuracy,
    required List<TopicAccuracy> topicAccuracies,
    required List<QuizSetScore> recentScores,
  }) async {
    state = const AsyncValue.loading();

    try {
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
      final userId = await ref.read(getUserIdProvider.future);

      if (userId == null) {
        throw Exception('User ID not found');
      }
      final totalAccuracy = await ref.read(getUserTotalAccuracyProvider(userId).future);
      final topicAccuracies = await ref.read(getUserTopicAccuracyProvider(userId).future);
      final recentScores = await ref.read(recentQuizScoresProvider(limit: 10).future);
      final newState = await _loadStatistics(
        totalAccuracy: totalAccuracy,
        topicAccuracies: topicAccuracies,
        recentScores: recentScores,
      );
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
