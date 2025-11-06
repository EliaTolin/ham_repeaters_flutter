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
      exam: json['exam'] as String,
      topicName: json['topic_name'] as String,
      correctLetter: json['correct_letter'] as String,
      questionText: json['question_text'] as String,
      isCorrect: json['is_correct'] as bool,
      correctAnswer: json['correct_answer'] as String,
      answeredAt: json['answered_at'] == null
          ? null
          : DateTime.parse(json['answered_at'] as String),
      timeMs: (json['time_ms'] as num?)?.toInt(),
      chosenLetter: json['chosen_letter'] as String?,
      chosenAnswer: json['chosen_answer'] as String?,
    );

Map<String, dynamic> _$QuizSetQuestionResultModelToJson(
        _QuizSetQuestionResultModel instance) =>
    <String, dynamic>{
      'set_id': instance.setId,
      'question_id': instance.questionId,
      'exam': instance.exam,
      'topic_name': instance.topicName,
      'correct_letter': instance.correctLetter,
      'question_text': instance.questionText,
      'is_correct': instance.isCorrect,
      'correct_answer': instance.correctAnswer,
      'answered_at': instance.answeredAt?.toIso8601String(),
      'time_ms': instance.timeMs,
      'chosen_letter': instance.chosenLetter,
      'chosen_answer': instance.chosenAnswer,
    };
