import 'package:flutter/material.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_results/controller/state/quiz_results_state.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_results/utils/exam_mode_accurancy_utils.dart';
import 'package:ham_repeaters/src/features/quiz/provider/all_quiz_scores/all_quiz_scores_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/delete_quiz_set/delete_quiz_set_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_quiz_results/get_quiz_results_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_user_topic_accuracy/get_user_topic_accuracy_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_user_total_accuracy/get_user_total_accuracy_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/quiz_answers/quiz_answers_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/recent_quiz_scores/recent_quiz_scores_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'quiz_results_controller.g.dart';

@riverpod
class QuizResultsController extends _$QuizResultsController {
  @override
  Future<QuizResultsState> build(String setId) async {
    try {
      final score = await ref.read(getQuizResultsProvider(setId).future);
      final answers = await ref.read(quizAnswersProvider(setId).future);
      final examTypeAccuracy =
          ExamModeAccuracyUtils.calculateExamTypeAccuracy(answers);
      return QuizResultsState(score: score, examTypeAccuracy: examTypeAccuracy);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      rethrow;
    }
  }

  Future<void> deleteQuizSet() async {
    try {
      await ref.read(deleteQuizSetProvider(setId).future);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
        ..invalidate(recentQuizScoresProvider)
        ..invalidate(allQuizScoresProvider)
        ..invalidate(getUserTopicAccuracyProvider)
        ..invalidate(getUserTotalAccuracyProvider);
    });
  }
}
