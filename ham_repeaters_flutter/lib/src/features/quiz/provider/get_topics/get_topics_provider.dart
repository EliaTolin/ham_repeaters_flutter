import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic/topic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_topics_provider.g.dart';

@riverpod
Future<List<Topic>> getTopics(Ref ref) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getTopics();
}
