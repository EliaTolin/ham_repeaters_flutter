import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entry.freezed.dart';

@freezed
abstract class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required String userId,
    required String displayName,
    required String? propic,
    required int points,
    required int correctAnswers,
    required int totalAnswers,
    required double accuracyPercent,
    required DateTime? lastAnsweredAt,
    required int rank,
  }) = _LeaderboardEntry;
}
