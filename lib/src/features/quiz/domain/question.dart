import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';

part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required int id,
    required String questionText,
    required String topicName,
    required ExamType exam,
    required String answerA,
    required String answerB,
    required String answerC,
    required String correctLetter,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? explanation,
    String? sourceRef,
  }) = _Question;
}
