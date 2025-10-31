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

  Future<void> deleteQuizSet() async {
    await ref.read(deleteQuizSetProvider(setId).future);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
        ..invalidate(recentQuizScoresProvider)
        ..invalidate(allQuizScoresProvider)
        ..invalidate(getUserTopicAccuracyProvider)
        ..invalidate(getUserTotalAccuracyProvider);
    });
  }
}
