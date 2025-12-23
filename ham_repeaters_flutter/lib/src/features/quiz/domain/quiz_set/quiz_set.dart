import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';

part 'quiz_set.freezed.dart';

@freezed
abstract class QuizSet with _$QuizSet {
  const factory QuizSet({
    required String id,
    required String userId,
    required DateTime startedAt,
    ExamType? exam,
    List<String>? customTopics,
    DateTime? finishedAt,
  }) = _QuizSet;
}
