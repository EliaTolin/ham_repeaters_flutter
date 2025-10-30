import 'package:quiz_radioamatori/src/features/quiz/presentation/marathon_quiz/state/marathon_state/marathon_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_topics_with_stats/get_topics_with_stats_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
