import 'package:quiz_radioamatori/src/features/profile/domain/profile/profile.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/state/quiz_dashboard_state/quiz_dashboard_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/all_quiz_scores/all_quiz_scores_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/recent_quiz_scores/recent_quiz_scores_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_dashboard_controller.g.dart';

@riverpod
class QuizDashboardController extends _$QuizDashboardController {
  @override
  Future<QuizDashboardState> build() async {
    final recentScores = await ref.watch(recentQuizScoresProvider().future);
    final allScores = await ref.watch(allQuizScoresProvider.future);
    final profile = await ref.watch(getProfileProvider.future);
    return _loadDashboardData(
      recentScores: recentScores,
      allScores: allScores,
      profile: profile,
    );
  }

  Future<QuizDashboardState> _loadDashboardData({
    required List<QuizSetScore> recentScores,
    required List<QuizSetScore> allScores,
    required Profile profile,
  }) async {
    try {
      // Calcola le statistiche reali
      final totalQuizzes = allScores.length;
      final averageAccuracy = allScores.isEmpty
          ? 0.0
          : allScores.fold<double>(0, (sum, score) => sum + score.accuracyPct) / allScores.length;

      return QuizDashboardState(
        recentScores: recentScores,
        totalQuizzes: totalQuizzes,
        averageAccuracy: averageAccuracy,
        profile: profile,
      );
    } catch (e) {
      return QuizDashboardState(
        recentScores: [],
        errorMessage: 'Errore nel caricamento dei dati: $e',
      );
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final recentScores = await ref.read(recentQuizScoresProvider().future);
      final allScores = await ref.read(allQuizScoresProvider.future);
      final profile = await ref.read(getProfileProvider.future);
      return _loadDashboardData(
        recentScores: recentScores,
        allScores: allScores,
        profile: profile,
      );
    });
  }

  void clearError() {
    state = state.whenData((data) => data.copyWith(errorMessage: null));
  }
}
