import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/provider/dashboard_data_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/state/quiz_dashboard_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_dashboard_controller.g.dart';

@riverpod
class QuizDashboardController extends _$QuizDashboardController {
  @override
  Future<QuizDashboardState> build() async {
    return _loadDashboardData();
  }

  Future<QuizDashboardState> _loadDashboardData() async {
    try {
      final recentScores = await ref.read(recentQuizScoresProvider.future);
      final allScores = await ref.read(allQuizScoresProvider.future);

      // Calcola le statistiche reali
      final totalQuizzes = allScores.length;
      final averageAccuracy = allScores.isEmpty
          ? 0.0
          : allScores.fold<double>(0, (sum, score) => sum + score.accuracyPct) / allScores.length;

      return QuizDashboardState(
        recentScores: recentScores,
        totalQuizzes: totalQuizzes,
        averageAccuracy: averageAccuracy,
      );
    } catch (e) {
      return QuizDashboardState(
        recentScores: [],
        errorMessage: 'Errore nel caricamento dei dati: $e',
      );
    }
  }

  Future<void> startQuiz(ExamType examType, BuildContext context) async {
    state = state.whenData((data) => data.copyWith(errorMessage: null));

    try {
      // Naviga alla pagina del quiz passando il tipo di esame
      await context.router.push(QuizRoute(examType: examType));
    } catch (e) {
      state = state.whenData(
        (data) => data.copyWith(
          errorMessage: "Errore durante l'avvio del quiz: $e",
        ),
      );
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_loadDashboardData);
  }

  void clearError() {
    state = state.whenData((data) => data.copyWith(errorMessage: null));
  }
}
