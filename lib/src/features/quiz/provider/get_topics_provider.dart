import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_topics_provider.g.dart';

@riverpod
Future<List<Topic>> getTopics(Ref ref) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getTopics();
}
