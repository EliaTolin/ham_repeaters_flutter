import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/provider/get_leaderboard/get_leaderboard_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard_controller.g.dart';

@riverpod
class LeaderboardController extends _$LeaderboardController {
  @override
  FutureOr<List<LeaderboardEntry>> build({
    int limit = 20,
  }) async {
    return await ref.read(getLeaderboardProvider(limit: limit).future);
  }

  Future<void> refresh() async {
    final limit = state.value?.length ?? 20;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref.read(getLeaderboardProvider(limit: limit).future);
    });
  }
}
