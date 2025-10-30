// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_set_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CuratedSetPreviewModel _$CuratedSetPreviewModelFromJson(
        Map<String, dynamic> json) =>
    _CuratedSetPreviewModel(
      id: json['id'] as String,
      title: json['title'] as String,
      questionsCount: (json['questions_count'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CuratedSetPreviewModelToJson(
        _CuratedSetPreviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questions_count': instance.questionsCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'description': instance.description,
    };
