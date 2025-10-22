import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/question.dart';

part 'quiz_state.freezed.dart';

@freezed
abstract class QuizState with _$QuizState {
  const factory QuizState({
    required String quizSetId,
    required List<Question> questions,
    required int totalQuestions,
  }) = _QuizState;
}