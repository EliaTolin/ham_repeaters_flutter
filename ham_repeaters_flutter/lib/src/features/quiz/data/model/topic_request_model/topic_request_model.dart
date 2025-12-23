import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_request_model.freezed.dart';
part 'topic_request_model.g.dart';

@freezed
abstract class TopicRequestModel with _$TopicRequestModel {
  const factory TopicRequestModel({
    required String topic,
    @JsonKey(name: 'num_questions') required int numQuestions,
  }) = _TopicRequestModel;

  factory TopicRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TopicRequestModelFromJson(json);
}
