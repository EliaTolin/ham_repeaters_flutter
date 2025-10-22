import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/question_model.dart';

part 'quiz_set_response_model.freezed.dart';
part 'quiz_set_response_model.g.dart';

@freezed
abstract class QuizSetResponseModel with _$QuizSetResponseModel {
  const factory QuizSetResponseModel({
    @JsonKey(name: 'quizSetId') required String quizSetId,
    required List<QuestionModel> questions,
    @JsonKey(name: 'totalQuestions') required int totalQuestions,
  }) = _QuizSetResponseModel;

  factory QuizSetResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetResponseModelFromJson(json);
}
