import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_set_question_result_model.freezed.dart';
part 'quiz_set_question_result_model.g.dart';

@freezed
abstract class QuizSetQuestionResultModel with _$QuizSetQuestionResultModel {
  const factory QuizSetQuestionResultModel({
    @JsonKey(name: 'set_id') required String setId,
    @JsonKey(name: 'question_id') required int questionId,
    @JsonKey(name: 'answered_at') required String answeredAt,
    @JsonKey(name: 'time_ms') required int timeMs,
    @JsonKey(name: 'topic_name') required String topicName,
    required String exam,
    @JsonKey(name: 'correct_letter') required String correctLetter,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'chosen_letter') String? chosenLetter,
    @JsonKey(name: 'chosen_answer') String? chosenAnswer,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    @JsonKey(name: 'question_text') String? questionText,
  }) = _QuizSetQuestionResultModel;

  factory QuizSetQuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetQuestionResultModelFromJson(json);
}
