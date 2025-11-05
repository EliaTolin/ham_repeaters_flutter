import 'package:quiz_radioamatori/src/features/leaderboard/data/datasource/leaderboard_datasource.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/data/datasource/leaderboard_supabase_datasource.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/data/mappers/leaderboard_mappers.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard_repository.g.dart';

class LeaderboardRepository {
  LeaderboardRepository(this._leaderboardDatasource);
  final LeaderboardDatasource _leaderboardDatasource;

  final _mapper = LeaderboardMappers();

  Future<List<LeaderboardEntry>> getLeaderboard({required int limit}) async {
    final models = await _leaderboardDatasource.getLeaderboard(limit: limit);
    return models.map(_mapper.fromModel).toList();
  }

  Future<LeaderboardEntry?> getUserPosition(String userId) async {
    final model = await _leaderboardDatasource.getUserPosition(userId);
    if (model == null) {
      return null;
    }
    return _mapper.fromModel(model);
  }
}

@riverpod
LeaderboardRepository leaderboardRepository(Ref ref) {
  final datasource = ref.read(leaderboardSupabaseDatasourceProvider);
  return LeaderboardRepository(datasource);
}
