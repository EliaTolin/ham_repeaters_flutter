import 'package:ham_repeaters/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_state/curated_sets_archive_state.dart';
import 'package:ham_repeaters/src/features/quiz/provider/curated_set_non_attempted/curated_set_non_attempted_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_all_published_curated_sets/get_all_published_curated_sets_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'curated_sets_archive_controller.g.dart';

@riverpod
class CuratedSetsArchiveController extends _$CuratedSetsArchiveController {
  @override
  Future<CuratedSetsArchiveState> build() async {
    try {
      final publishedSets =
          await ref.read(getAllPublishedCuratedSetsProvider.future);
      final userId = await ref.read(getUserIdProvider.future);

      if (userId == null) {
        // Se non c'è userId, tutti i set sono considerati non completati
        final items = publishedSets
            .map(
              (set) => CuratedSetArchiveItem(
                curatedSet: set,
                isCompleted: false,
              ),
            )
            .toList();
        return CuratedSetsArchiveState(items: items);
      }

      // Ottieni i set non ancora tentati
      final nonAttemptedSets =
          await ref.read(curatedSetNonAttemptedProvider(userId).future);
      final nonAttemptedIds = nonAttemptedSets.map((s) => s.id).toSet();

      // Crea gli items con lo stato di completamento
      final items = publishedSets
          .map(
            (set) => CuratedSetArchiveItem(
              curatedSet: set,
              // Se il set è nella lista dei non tentati, non è completato
              isCompleted: !nonAttemptedIds.contains(set.id),
            ),
          )
          .toList();

      return CuratedSetsArchiveState(items: items);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      return CuratedSetsArchiveState(errorMessage: 'Errore: $e');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final publishedSets =
          await ref.read(getAllPublishedCuratedSetsProvider.future);
      final userId = await ref.read(getUserIdProvider.future);

      if (userId == null) {
        final items = publishedSets
            .map(
              (set) => CuratedSetArchiveItem(
                curatedSet: set,
                isCompleted: false,
              ),
            )
            .toList();
        return CuratedSetsArchiveState(items: items);
      }

      final nonAttemptedSets =
          await ref.read(curatedSetNonAttemptedProvider(userId).future);
      final nonAttemptedIds = nonAttemptedSets.map((s) => s.id).toSet();

      final items = publishedSets
          .map(
            (set) => CuratedSetArchiveItem(
              curatedSet: set,
              isCompleted: !nonAttemptedIds.contains(set.id),
            ),
          )
          .toList();

      return CuratedSetsArchiveState(items: items);
    });
  }

  void clearError() {
    state = state.whenData((data) => data.copyWith(errorMessage: null));
  }
}
