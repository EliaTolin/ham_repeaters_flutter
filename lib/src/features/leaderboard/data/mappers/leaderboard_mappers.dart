import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/data/model/leaderboard_entry_model/leaderboard_entry_model.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';

class LeaderboardMappers implements Mapper<LeaderboardEntry, LeaderboardEntryModel> {
  @override
  LeaderboardEntry fromModel(LeaderboardEntryModel model) {
    return LeaderboardEntry(
      userId: model.userId,
      displayName: model.displayName,
      propic: model.propic,
      points: model.points,
      correctAnswers: model.correctAnswers,
      totalAnswers: model.totalAnswers,
      accuracyPercent: model.accuracyPercent,
      lastAnsweredAt: model.lastAnsweredAt != null ? DateTime.parse(model.lastAnsweredAt!) : null,
      rank: model.rank,
    );
  }

  @override
  LeaderboardEntryModel toModel(LeaderboardEntry entity) {
    return LeaderboardEntryModel(
      userId: entity.userId,
      displayName: entity.displayName,
      propic: entity.propic,
      points: entity.points,
      correctAnswers: entity.correctAnswers,
      totalAnswers: entity.totalAnswers,
      accuracyPercent: entity.accuracyPercent,
      lastAnsweredAt: entity.lastAnsweredAt?.toIso8601String(),
      rank: entity.rank,
    );
  }
}
