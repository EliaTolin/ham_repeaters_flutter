// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSetResponseModel _$QuizSetResponseModelFromJson(
        Map<String, dynamic> json) =>
    _QuizSetResponseModel(
      quizSetId: json['quizSetId'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
    );

Map<String, dynamic> _$QuizSetResponseModelToJson(
        _QuizSetResponseModel instance) =>
    <String, dynamic>{
      'quizSetId': instance.quizSetId,
      'questions': instance.questions,
      'totalQuestions': instance.totalQuestions,
    };
