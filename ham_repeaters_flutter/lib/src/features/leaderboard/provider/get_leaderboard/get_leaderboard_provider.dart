import 'package:ham_repeaters/src/features/leaderboard/data/repository/leaderboard_repository.dart';
import 'package:ham_repeaters/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_leaderboard_provider.g.dart';

@riverpod
Future<List<LeaderboardEntry>> getLeaderboard(
  Ref ref, {
  int limit = 20,
}) async {
  final repository = ref.read(leaderboardRepositoryProvider);
  return repository.getLeaderboard(limit: limit);
}
