// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSetScoreModel _$QuizSetScoreModelFromJson(Map<String, dynamic> json) =>
    _QuizSetScoreModel(
      setId: json['set_id'] as String,
      userId: json['user_id'] as String,
      mode: $enumDecode(_$QuizModeEnumMap, json['mode']),
      answered: (json['answered'] as num).toInt(),
      correct: (json['correct'] as num).toInt(),
      wrong: (json['wrong'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      accuracyPct: (json['accuracy_pct'] as num).toDouble(),
      exam: $enumDecodeNullable(_$ExamTypeEnumMap, json['exam']),
      customTopics: (json['custom_topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizSetScoreModelToJson(_QuizSetScoreModel instance) =>
    <String, dynamic>{
      'set_id': instance.setId,
      'user_id': instance.userId,
      'mode': _$QuizModeEnumMap[instance.mode]!,
      'answered': instance.answered,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'accuracy_pct': instance.accuracyPct,
      'exam': _$ExamTypeEnumMap[instance.exam],
      'custom_topics': instance.customTopics,
    };

const _$QuizModeEnumMap = {
  QuizMode.perTopic: 'perTopic',
  QuizMode.perEsame: 'perEsame',
};

const _$ExamTypeEnumMap = {
  ExamType.parziale: 'parziale',
  ExamType.totale: 'totale',
};
