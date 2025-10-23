import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/converters/quiz_converters.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';

part 'quiz_question_result_model.freezed.dart';
part 'quiz_question_result_model.g.dart';

@freezed
abstract class QuizQuestionResultModel with _$QuizQuestionResultModel {
  const factory QuizQuestionResultModel({
    @JsonKey(name: 'set_id') required String setId,
    @JsonKey(name: 'question_id') required int questionId,
    @JsonKey(name: 'topic_name') required String topicName,
    @ExamTypeConverter() required ExamType exam,
    @JsonKey(name: 'correct_letter') required String correctLetter,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'chosen_letter') String? chosenLetter,
    @JsonKey(name: 'answered_at') String? answeredAt,
    @JsonKey(name: 'time_ms') int? timeMs,
  }) = _QuizQuestionResultModel;

  factory QuizQuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionResultModelFromJson(json);
}
