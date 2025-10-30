import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_with_stats.freezed.dart';

@freezed
abstract class TopicWithStats with _$TopicWithStats {
  const factory TopicWithStats({
    required String name,
    required String label,
    required int totalQuestions,
    String? description,
  }) = _TopicWithStats;
}
