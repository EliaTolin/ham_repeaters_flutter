// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSetScoreModel _$QuizSetScoreModelFromJson(Map<String, dynamic> json) =>
    _QuizSetScoreModel(
      setId: json['set_id'] as String,
      userId: json['user_id'] as String,
      mode: const QuizModeConverter().fromJson(json['mode'] as String),
      answered: (json['answered'] as num).toInt(),
      correct: (json['correct'] as num).toInt(),
      wrong: (json['wrong'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      accuracyPct: (json['accuracy_pct'] as num).toDouble(),
      startedAt: DateTime.parse(json['started_at'] as String),
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
      exam: const ExamTypeConverter().fromJson(json['exam'] as String?),
      customTopics: (json['custom_topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizSetScoreModelToJson(_QuizSetScoreModel instance) =>
    <String, dynamic>{
      'set_id': instance.setId,
      'user_id': instance.userId,
      'mode': const QuizModeConverter().toJson(instance.mode),
      'answered': instance.answered,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'accuracy_pct': instance.accuracyPct,
      'started_at': instance.startedAt.toIso8601String(),
      'finished_at': instance.finishedAt?.toIso8601String(),
      'exam': const ExamTypeConverter().toJson(instance.exam),
      'custom_topics': instance.customTopics,
    };
