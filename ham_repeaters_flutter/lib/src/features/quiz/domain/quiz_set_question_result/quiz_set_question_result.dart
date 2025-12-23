import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';

part 'quiz_set_question_result.freezed.dart';

@freezed
abstract class QuizSetQuestionResult with _$QuizSetQuestionResult {
  const factory QuizSetQuestionResult({
    required String setId,
    required int questionId,
    required String topicName,
    required ExamType exam,
    required String correctLetter,
    required bool isCorrect,
    required String correctAnswer,
    required String questionText,
    String? chosenLetter,
    DateTime? answeredAt,
    int? timeMs,
    String? chosenAnswer,
  }) = _QuizSetQuestionResult;
}
