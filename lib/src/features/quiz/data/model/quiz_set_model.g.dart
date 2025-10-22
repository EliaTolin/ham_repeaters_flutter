// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSetModel _$QuizSetModelFromJson(Map<String, dynamic> json) =>
    _QuizSetModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      startedAt: json['started_at'] as String,
      exam: $enumDecodeNullable(_$ExamTypeEnumMap, json['exam']),
      customTopics: (json['custom_topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      finishedAt: json['finished_at'] as String?,
    );

Map<String, dynamic> _$QuizSetModelToJson(_QuizSetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'started_at': instance.startedAt,
      'exam': _$ExamTypeEnumMap[instance.exam],
      'custom_topics': instance.customTopics,
      'finished_at': instance.finishedAt,
    };

const _$ExamTypeEnumMap = {
  ExamType.parziale: 'parziale',
  ExamType.totale: 'totale',
};
