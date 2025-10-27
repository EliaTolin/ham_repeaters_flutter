// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: (json['id'] as num).toInt(),
      questionText: json['question_text'] as String,
      topicName: json['topic_name'] as String,
      exam: json['exam'] as String,
      answerA: json['answer_a'] as String,
      answerB: json['answer_b'] as String,
      answerC: json['answer_c'] as String,
      correctLetter: json['correct_letter'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      explanation: json['explanation'] as String?,
      sourceRef: json['source_ref'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'topic_name': instance.topicName,
      'exam': instance.exam,
      'answer_a': instance.answerA,
      'answer_b': instance.answerB,
      'answer_c': instance.answerC,
      'correct_letter': instance.correctLetter,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'explanation': instance.explanation,
      'source_ref': instance.sourceRef,
    };
