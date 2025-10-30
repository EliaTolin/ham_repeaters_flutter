import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';

part 'quiz_question_result.freezed.dart';

@freezed
abstract class QuizQuestionResult with _$QuizQuestionResult {
  const factory QuizQuestionResult({
    required String setId,
    required int questionId,
    required String topicName,
    required ExamType exam,
    required String correctLetter,
    required bool isCorrect,
    String? chosenLetter,
    DateTime? answeredAt,
    int? timeMs,
  }) = _QuizQuestionResult;
}
