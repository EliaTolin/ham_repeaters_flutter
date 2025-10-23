import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

part 'quiz_dashboard_state.freezed.dart';

@freezed
abstract class QuizDashboardState with _$QuizDashboardState {
  const factory QuizDashboardState({
    List<QuizSetScore>? recentScores,
    String? errorMessage,
  }) = _QuizDashboardState;
}
