import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';

part 'quiz_set_model.freezed.dart';
part 'quiz_set_model.g.dart';

@freezed
abstract class QuizSetModel with _$QuizSetModel {
  const factory QuizSetModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'started_at') required String startedAt,
    ExamType? exam,
    @JsonKey(name: 'custom_topics') List<String>? customTopics,
    @JsonKey(name: 'finished_at') String? finishedAt,
  }) = _QuizSetModel;

  factory QuizSetModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetModelFromJson(json);
}
