import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/state/quiz_dashboard_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_dashboard_controller.g.dart';

@riverpod
class QuizDashboardController extends _$QuizDashboardController {
  @override
  QuizDashboardState build() {
    return const QuizDashboardState();
  }

  Future<void> startQuiz(ExamType examType, BuildContext context) async {
    state = state.copyWith(errorMessage: null);

    try {
      // Naviga alla pagina del quiz passando il tipo di esame
      await context.router.push(QuizRoute(examType: examType));
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Errore durante l'avvio del quiz: $e",
      );
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
