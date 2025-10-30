import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_with_stats_model.freezed.dart';

@freezed
abstract class TopicWithStatsModel with _$TopicWithStatsModel {
  const factory TopicWithStatsModel({
    required String name,
    required String label,
    required int totalQuestions,
    String? description,
  }) = _TopicWithStatsModel;

  factory TopicWithStatsModel.fromJson(Map<String, dynamic> json) {
    return TopicWithStatsModel(
      name: json['name'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
      totalQuestions: json['total_questions'] as int,
    );
  }
}
