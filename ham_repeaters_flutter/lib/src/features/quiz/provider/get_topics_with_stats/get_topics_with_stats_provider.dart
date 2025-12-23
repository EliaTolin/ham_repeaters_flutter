import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_with_stats/topic_with_stats.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_topics_with_stats_provider.g.dart';

@riverpod
Future<List<TopicWithStats>> getTopicsWithStats(Ref ref) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getTopicsWithStats();
}
