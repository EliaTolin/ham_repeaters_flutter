import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_accuracy_model.freezed.dart';

@freezed
abstract class TopicAccuracyModel with _$TopicAccuracyModel {
  const factory TopicAccuracyModel({
    required String topicName,
    required String label,
    @JsonKey(name: 'total_answers') required int totalAnswers,
    @JsonKey(name: 'correct_answers') required int correctAnswers,
    @JsonKey(name: 'wrong_answers') required int wrongAnswers,
    @JsonKey(name: 'accuracy_percent') required double accuracyPercent,
  }) = _TopicAccuracyModel;

  factory TopicAccuracyModel.fromJson(Map<String, dynamic> json) {
    return TopicAccuracyModel(
      topicName: json['topic_name'] as String,
      label: json['label'] as String,
      totalAnswers: json['total_answers'] as int,
      correctAnswers: json['correct_answers'] as int,
      wrongAnswers: json['wrong_answers'] as int,
      accuracyPercent: (json['accuracy_percent'] as num).toDouble(),
    );
  }
}
