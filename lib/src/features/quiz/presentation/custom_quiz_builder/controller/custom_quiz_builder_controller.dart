import 'package:quiz_radioamatori/src/features/quiz/presentation/custom_quiz_builder/state/custom_quiz_builder_state/custom_quiz_builder_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_topics_with_stats/get_topics_with_stats_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_quiz_builder_controller.g.dart';

@riverpod
class CustomQuizBuilderController extends _$CustomQuizBuilderController {
  @override
  FutureOr<CustomQuizBuilderState> build() async {
    final topics = await ref.read(getTopicsWithStatsProvider.future);
    return CustomQuizBuilderState(
      availableTopics: topics,
    );
  }

  void toggleTopic(String topicName) {
    final currentState = state.value;
    if (currentState == null) return;

    final newSelectedTopics = Map<String, int>.from(currentState.selectedTopics);

    if (newSelectedTopics.containsKey(topicName)) {
      newSelectedTopics.remove(topicName);
    } else {
      newSelectedTopics[topicName] = 1; // Default to 1 question
    }

    state = AsyncValue.data(currentState.copyWith(selectedTopics: newSelectedTopics));
  }

  void updateQuestionCount(String topicName, int count) {
    final currentState = state.value;
    if (currentState == null) return;

    final newSelectedTopics = Map<String, int>.from(currentState.selectedTopics);

    if (count <= 0) {
      newSelectedTopics.remove(topicName);
    } else {
      newSelectedTopics[topicName] = count;
    }

    state = AsyncValue.data(currentState.copyWith(selectedTopics: newSelectedTopics));
  }

  void clearSelection() {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(currentState.copyWith(selectedTopics: {}));
  }

  Future<void> loadTopics() async {
    state = const AsyncValue.loading();

    try {
      final topics = await ref.read(getTopicsWithStatsProvider.future);
      state = AsyncValue.data(
        CustomQuizBuilderState(
          availableTopics: topics,
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
