import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_accuracy/topic_accuracy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_topic_accuracy_provider.g.dart';

@riverpod
Future<List<TopicAccuracy>> getUserTopicAccuracy(Ref ref, String userId) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getUserTopicAccuracy(userId);
}
