// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicRequestModel _$TopicRequestModelFromJson(Map<String, dynamic> json) =>
    _TopicRequestModel(
      topic: json['topic'] as String,
      numQuestions: (json['num_questions'] as num).toInt(),
    );

Map<String, dynamic> _$TopicRequestModelToJson(_TopicRequestModel instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'num_questions': instance.numQuestions,
    };
