import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile/profile.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/controller/quiz_dashboard_state/quiz_dashboard_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/all_quiz_scores/all_quiz_scores_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/curated_set_non_attempted/curated_set_non_attempted_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/recent_quiz_scores/recent_quiz_scores_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'quiz_dashboard_controller.g.dart';

@riverpod
class QuizDashboardController extends _$QuizDashboardController {
  @override
  Future<QuizDashboardState> build() async {
    try {
      final recentScores = await ref.watch(recentQuizScoresProvider().future);
      final allScores = await ref.watch(allQuizScoresProvider.future);
      final userId = await ref.watch(getUserIdProvider.future);

      final curatedSetsPreviews = userId != null
          ? await ref.watch(curatedSetNonAttemptedProvider(userId).future)
          : <CuratedSetPreview>[];

      final profile = await ref.watch(getProfileProvider.future);
      return _loadDashboardData(
        recentScores: recentScores,
        allScores: allScores,
        profile: profile,
        curatedSetsPreviews: curatedSetsPreviews,
      );
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      return QuizDashboardState(
        recentScores: [],
        curatedSetsPreviews: [],
        errorMessage: 'Errore nel caricamento dei dati: $e',
      );
    }
  }

  Future<QuizDashboardState> _loadDashboardData({
    required List<QuizSetScore> recentScores,
    required List<QuizSetScore> allScores,
    required Profile profile,
    required List<CuratedSetPreview> curatedSetsPreviews,
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
        curatedSetsPreviews: curatedSetsPreviews,
      );
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      return QuizDashboardState(
        recentScores: [],
        curatedSetsPreviews: [],
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
      final userId = await ref.read(getUserIdProvider.future);
      final curatedSetsPreviews = userId != null
          ? await ref.read(curatedSetNonAttemptedProvider(userId).future)
          : <CuratedSetPreview>[];
      return _loadDashboardData(
        recentScores: recentScores,
        allScores: allScores,
        profile: profile,
        curatedSetsPreviews: curatedSetsPreviews,
      );
    });
  }

  void clearError() {
    state = state.whenData((data) => data.copyWith(errorMessage: null));
  }
}
