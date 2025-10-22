import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_set_question_model.freezed.dart';
part 'quiz_set_question_model.g.dart';

@freezed
abstract class QuizSetQuestionModel with _$QuizSetQuestionModel {
  const factory QuizSetQuestionModel({
    @JsonKey(name: 'set_id') required String setId,
    @JsonKey(name: 'question_id') required int questionId,
    @JsonKey(name: 'chosen_letter') String? chosenLetter,
    @JsonKey(name: 'answered_at') String? answeredAt,
    @JsonKey(name: 'time_ms') int? timeMs,
  }) = _QuizSetQuestionModel;

  factory QuizSetQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetQuestionModelFromJson(json);
}
