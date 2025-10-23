import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

part 'quiz_dashboard_state.freezed.dart';

@freezed
abstract class QuizDashboardState with _$QuizDashboardState {
  const factory QuizDashboardState({
    List<QuizSetScore>? recentScores,
    @Default(0) int totalQuizzes,
    @Default(0.0) double averageAccuracy,
    Profile? profile,
    String? errorMessage,
  }) = _QuizDashboardState;
}
