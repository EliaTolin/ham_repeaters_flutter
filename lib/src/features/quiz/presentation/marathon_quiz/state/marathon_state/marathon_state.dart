import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_with_stats/topic_with_stats.dart';

part 'marathon_state.freezed.dart';

@freezed
abstract class MarathonState with _$MarathonState {
  const factory MarathonState({
    required List<TopicWithStats> availableTopics,
    String? selectedTopic,
    @Default(false) bool isStarting,
    String? errorMessage,
  }) = _MarathonState;

  const MarathonState._();

  TopicWithStats? get selectedTopicDetails {
    if (selectedTopic == null) return null;
    return availableTopics.firstWhere(
      (topic) => topic.name == selectedTopic,
      orElse: () => const TopicWithStats(
        name: '',
        label: '',
        totalQuestions: 0,
      ),
    );
  }

  bool get canStartMarathon => selectedTopic != null && selectedTopicDetails?.totalQuestions != 0;
}
