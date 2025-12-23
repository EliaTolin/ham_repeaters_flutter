import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_mode.dart';

part 'quiz_set_score.freezed.dart';

@freezed
abstract class QuizSetScore with _$QuizSetScore {
  const factory QuizSetScore({
    required String setId,
    required String userId,
    required QuizMode mode,
    required int answered,
    required int correct,
    required int wrong,
    required int total,
    required double accuracyPct,
    required DateTime startedAt,
    ExamType? exam,
    List<String>? customTopics,
    DateTime? finishedAt,
  }) = _QuizSetScore;
}
