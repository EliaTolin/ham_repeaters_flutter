import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_dashboard_state.freezed.dart';

@freezed
abstract class QuizDashboardState with _$QuizDashboardState {
  const factory QuizDashboardState({
    String? errorMessage,
  }) = _QuizDashboardState;
}
