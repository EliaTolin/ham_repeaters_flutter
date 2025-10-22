// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_question_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSetQuestionResultModel _$QuizSetQuestionResultModelFromJson(
        Map<String, dynamic> json) =>
    _QuizSetQuestionResultModel(
      setId: json['set_id'] as String,
      questionId: (json['question_id'] as num).toInt(),
      topicName: json['topic_name'] as String,
      exam: $enumDecode(_$ExamTypeEnumMap, json['exam']),
      correctLetter: json['correct_letter'] as String,
      isCorrect: json['is_correct'] as bool,
      chosenLetter: json['chosen_letter'] as String?,
      answeredAt: json['answered_at'] as String?,
      timeMs: (json['time_ms'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizSetQuestionResultModelToJson(
        _QuizSetQuestionResultModel instance) =>
    <String, dynamic>{
      'set_id': instance.setId,
      'question_id': instance.questionId,
      'topic_name': instance.topicName,
      'exam': _$ExamTypeEnumMap[instance.exam]!,
      'correct_letter': instance.correctLetter,
      'is_correct': instance.isCorrect,
      'chosen_letter': instance.chosenLetter,
      'answered_at': instance.answeredAt,
      'time_ms': instance.timeMs,
    };

const _$ExamTypeEnumMap = {
  ExamType.parziale: 'parziale',
  ExamType.completo: 'completo',
};
