import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/domain.dart';

part 'quiz_results_state.freezed.dart';

@freezed
abstract class QuizResultsState with _$QuizResultsState {
  const factory QuizResultsState({
    required QuizSetScore score,
    required Map<ExamType, double> examTypeAccuracy,
  }) = _QuizResultsState;
}
