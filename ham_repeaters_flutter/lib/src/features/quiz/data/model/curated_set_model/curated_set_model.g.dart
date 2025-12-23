// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CuratedSetModel _$CuratedSetModelFromJson(Map<String, dynamic> json) =>
    _CuratedSetModel(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      title: json['title'] as String,
      isPublished: json['is_published'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      description: json['description'] as String?,
      customTopics: (json['custom_topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CuratedSetModelToJson(_CuratedSetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'is_published': instance.isPublished,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'description': instance.description,
      'custom_topics': instance.customTopics,
    };
