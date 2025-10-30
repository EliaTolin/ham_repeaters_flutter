import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_state/curated_sets_archive_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/curated_set_non_attempted/curated_set_non_attempted_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'curated_sets_archive_controller.g.dart';

@riverpod
class CuratedSetsArchiveController extends _$CuratedSetsArchiveController {
  @override
  Future<CuratedSetsArchiveState> build() async {
    final userId = await ref.read(getUserIdProvider.future);
    if (userId == null) {
      return const CuratedSetsArchiveState(items: []);
    }
    try {
      final items = await ref.read(curatedSetNonAttemptedProvider(userId).future);
      return CuratedSetsArchiveState(items: items);
    } catch (e) {
      return CuratedSetsArchiveState(items: const [], errorMessage: 'Errore: $e');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userId = await ref.read(getUserIdProvider.future);
      if (userId == null) {
        return const CuratedSetsArchiveState(items: []);
      }
      final items = await ref.read(curatedSetNonAttemptedProvider(userId).future);
      return CuratedSetsArchiveState(items: items);
    });
  }

  void clearError() {
    state = state.whenData((data) => data.copyWith(errorMessage: null));
  }
}


