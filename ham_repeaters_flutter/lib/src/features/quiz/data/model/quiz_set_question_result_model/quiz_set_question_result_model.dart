import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_set_question_result_model.freezed.dart';
part 'quiz_set_question_result_model.g.dart';

@freezed
abstract class QuizSetQuestionResultModel with _$QuizSetQuestionResultModel {
  const factory QuizSetQuestionResultModel({
    @JsonKey(name: 'set_id') required String setId,
    @JsonKey(name: 'question_id') required int questionId,
    required String exam,
    @JsonKey(name: 'topic_name') required String topicName,
    @JsonKey(name: 'correct_letter') required String correctLetter,
    @JsonKey(name: 'question_text') required String questionText,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
    @JsonKey(name: 'answered_at') DateTime? answeredAt,
    @JsonKey(name: 'time_ms') int? timeMs,
    @JsonKey(name: 'chosen_letter') String? chosenLetter,
    @JsonKey(name: 'chosen_answer') String? chosenAnswer,
  }) = _QuizSetQuestionResultModel;

  factory QuizSetQuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetQuestionResultModelFromJson(json);
}
