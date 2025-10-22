// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSetQuestionModel _$QuizSetQuestionModelFromJson(
        Map<String, dynamic> json) =>
    _QuizSetQuestionModel(
      setId: json['set_id'] as String,
      questionId: (json['question_id'] as num).toInt(),
      chosenLetter: json['chosen_letter'] as String?,
      answeredAt: json['answered_at'] as String?,
      timeMs: (json['time_ms'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizSetQuestionModelToJson(
        _QuizSetQuestionModel instance) =>
    <String, dynamic>{
      'set_id': instance.setId,
      'question_id': instance.questionId,
      'chosen_letter': instance.chosenLetter,
      'answered_at': instance.answeredAt,
      'time_ms': instance.timeMs,
    };
