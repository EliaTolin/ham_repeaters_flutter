import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/data/repository/leaderboard_repository.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_position_provider.g.dart';

@riverpod
Future<LeaderboardEntry?> getUserPosition(Ref ref) async {
  final userId = await ref.read(getUserIdProvider.future);
  if (userId == null) {
    return null;
  }
  final repository = ref.read(leaderboardRepositoryProvider);
  return repository.getUserPosition(userId);
}
