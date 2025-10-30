import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';

@freezed
abstract class Topic with _$Topic {
  const factory Topic({
    required String name,
    required String label,
    String? description,
  }) = _Topic;
}
