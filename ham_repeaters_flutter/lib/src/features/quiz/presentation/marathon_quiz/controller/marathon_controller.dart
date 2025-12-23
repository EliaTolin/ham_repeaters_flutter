import 'package:ham_repeaters/src/features/quiz/presentation/marathon_quiz/state/marathon_state/marathon_state.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_topics_with_stats/get_topics_with_stats_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'marathon_controller.g.dart';

@riverpod
class MarathonController extends _$MarathonController {
  @override
  FutureOr<MarathonState> build() async {
    final topics = await ref.read(getTopicsWithStatsProvider.future);
    return MarathonState(
      availableTopics: topics,
    );
  }

  void selectTopic(String topicName) {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(
      currentState.copyWith(selectedTopic: topicName),
    );
  }

  void clearSelection() {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(currentState.copyWith(selectedTopic: null));
  }

  Future<void> loadTopics() async {
    state = const AsyncValue.loading();

    try {
      final topics = await ref.read(getTopicsWithStatsProvider.future);
      state = AsyncValue.data(
        MarathonState(
          availableTopics: topics,
        ),
      );
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
