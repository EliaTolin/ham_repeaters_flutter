import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_accuracy/topic_accuracy.dart';
import 'package:ham_repeaters/src/features/quiz/domain/total_accuracy/total_accuracy.dart';

part 'statistics_state.freezed.dart';

@freezed
abstract class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    required List<TopicAccuracy> topicAccuracies,
    required List<QuizSetScore> recentScores,
    TotalAccuracy? totalAccuracy,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _StatisticsState;

  const StatisticsState._();

  List<TopicAccuracy> get sortedTopicsStrongest => List.from(topicAccuracies)
    ..sort((a, b) => b.accuracyPercent.compareTo(a.accuracyPercent));

  List<TopicAccuracy> get sortedTopicsWeakest => List.from(topicAccuracies)
    ..sort((a, b) => a.accuracyPercent.compareTo(b.accuracyPercent));

  List<TopicAccuracy> get top5StrongTopics =>
      sortedTopicsStrongest.take(5).toList();

  List<TopicAccuracy> get top5WeakTopics =>
      sortedTopicsWeakest.take(5).toList();
}
