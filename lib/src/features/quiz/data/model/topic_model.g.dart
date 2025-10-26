// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicModel _$TopicModelFromJson(Map<String, dynamic> json) => _TopicModel(
      name: json['name'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TopicModelToJson(_TopicModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'description': instance.description,
    };
