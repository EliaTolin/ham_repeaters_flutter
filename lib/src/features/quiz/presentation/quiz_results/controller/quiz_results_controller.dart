import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/all_quiz_scores/all_quiz_scores_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/delete_quiz_set/delete_quiz_set_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_user_topic_accuracy/get_user_topic_accuracy_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_user_total_accuracy/get_user_total_accuracy_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/recent_quiz_scores/recent_quiz_scores_provider.dart'
    show recentQuizScoresProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'quiz_results_controller.g.dart';

@riverpod
class QuizResultsController extends _$QuizResultsController {
  @override
  Future<QuizSetScore?> build(String setId) async {
    try {
      return await _loadQuizResults(setId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      rethrow;
    }
  }

  Future<QuizSetScore?> _loadQuizResults(String setId) async {
    try {
      final repository = ref.read(quizRepositoryProvider);
      return await repository.getQuizResults(setId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      // Re-throw the error to be handled by the UI
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      state = await AsyncValue.guard(() => _loadQuizResults(setId));
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
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
