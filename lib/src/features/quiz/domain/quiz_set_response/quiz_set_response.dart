import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/question/question.dart';

part 'quiz_set_response.freezed.dart';

@freezed
abstract class QuizSetResponse with _$QuizSetResponse {
  const factory QuizSetResponse({
    required String quizSetId,
    required List<Question> questions,
    required int totalQuestions,
  }) = _QuizSetResponse;
}
