import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile/profile.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/domain.dart';

part 'quiz_dashboard_state.freezed.dart';

@freezed
abstract class QuizDashboardState with _$QuizDashboardState {
  const factory QuizDashboardState({
    List<QuizSetScore>? recentScores,
    List<CuratedSetPreview>? curatedSetsPreviews,
    @Default(0) int totalQuizzes,
    @Default(0.0) double averageAccuracy,
    Profile? profile,
    LeaderboardEntry? userPosition,
    String? errorMessage,
  }) = _QuizDashboardState;
}
