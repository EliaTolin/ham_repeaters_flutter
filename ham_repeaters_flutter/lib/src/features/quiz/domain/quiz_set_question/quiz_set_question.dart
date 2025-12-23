import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_set_question.freezed.dart';

@freezed
abstract class QuizSetQuestion with _$QuizSetQuestion {
  const factory QuizSetQuestion({
    required String setId,
    required int questionId,
    String? chosenLetter,
    DateTime? answeredAt,
    int? timeMs,
  }) = _QuizSetQuestion;
}
