import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int id,
    @JsonKey(name: 'question_text') required String questionText,
    @JsonKey(name: 'topic_name') required String topicName,
    required String exam,
    @JsonKey(name: 'answer_a') required String answerA,
    @JsonKey(name: 'answer_b') required String answerB,
    @JsonKey(name: 'answer_c') required String answerC,
    @JsonKey(name: 'correct_letter') required String correctLetter,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    String? explanation,
    @JsonKey(name: 'source_ref') String? sourceRef,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
}
