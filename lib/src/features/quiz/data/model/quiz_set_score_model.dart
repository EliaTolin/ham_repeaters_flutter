import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_mode.dart';

part 'quiz_set_score_model.freezed.dart';
part 'quiz_set_score_model.g.dart';

@freezed
abstract class QuizSetScoreModel with _$QuizSetScoreModel {
  const factory QuizSetScoreModel({
    @JsonKey(name: 'set_id') required String setId,
    @JsonKey(name: 'user_id') required String userId,
    required QuizMode mode,
    required int answered,
    required int correct,
    required int wrong,
    required int total,
    @JsonKey(name: 'accuracy_pct') required double accuracyPct,
    ExamType? exam,
    @JsonKey(name: 'custom_topics') List<String>? customTopics,
  }) = _QuizSetScoreModel;

  factory QuizSetScoreModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetScoreModelFromJson(json);
}
