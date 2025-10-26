import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_accuracy.freezed.dart';

@freezed
abstract class TopicAccuracy with _$TopicAccuracy {
  const factory TopicAccuracy({
    required String topicName,
    required String label,
    required int totalAnswers,
    required int correctAnswers,
    required int wrongAnswers,
    required double accuracyPercent,
  }) = _TopicAccuracy;
}
