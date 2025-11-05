import 'package:quiz_radioamatori/src/features/leaderboard/data/model/leaderboard_entry_model/leaderboard_entry_model.dart';

abstract interface class LeaderboardDatasource {
  Future<List<LeaderboardEntryModel>> getLeaderboard({required int limit});
  Future<LeaderboardEntryModel?> getUserPosition(String userId);
}
