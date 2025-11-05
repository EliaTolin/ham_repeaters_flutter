import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entry_model.freezed.dart';
part 'leaderboard_entry_model.g.dart';

@freezed
abstract class LeaderboardEntryModel with _$LeaderboardEntryModel {
  const factory LeaderboardEntryModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'display_name') required String displayName,
    required String? propic,
    required int points,
    @JsonKey(name: 'correct_answers') required int correctAnswers,
    @JsonKey(name: 'total_answers') required int totalAnswers,
    @JsonKey(name: 'accuracy_percent') required double accuracyPercent,
    @JsonKey(name: 'last_answered_at') required String? lastAnsweredAt,
    required int rank,
  }) = _LeaderboardEntryModel;

  factory LeaderboardEntryModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryModelFromJson(json);
}
