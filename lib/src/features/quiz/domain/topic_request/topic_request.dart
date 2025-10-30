import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_request.freezed.dart';

@freezed
abstract class TopicRequest with _$TopicRequest {
  const factory TopicRequest({
    required String topic,
    required int numQuestions,
  }) = _TopicRequest;
}
