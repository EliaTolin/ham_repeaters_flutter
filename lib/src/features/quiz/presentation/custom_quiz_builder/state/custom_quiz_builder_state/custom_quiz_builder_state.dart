import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_with_stats/topic_with_stats.dart';

part 'custom_quiz_builder_state.freezed.dart';

@freezed
abstract class CustomQuizBuilderState with _$CustomQuizBuilderState {
  const factory CustomQuizBuilderState({
    required List<TopicWithStats> availableTopics,
    @Default({}) Map<String, int> selectedTopics, // topic name -> num questions
    String? errorMessage,
  }) = _CustomQuizBuilderState;

  const CustomQuizBuilderState._();

  bool get hasSelectedTopics => selectedTopics.isNotEmpty;

  int get totalQuestions => selectedTopics.values.fold(0, (sum, count) => sum + count);
}
