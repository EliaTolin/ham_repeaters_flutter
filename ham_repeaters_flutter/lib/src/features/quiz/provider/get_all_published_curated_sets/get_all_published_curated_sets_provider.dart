import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set/curated_set.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_published_curated_sets_provider.g.dart';

@riverpod
Future<List<CuratedSet>> getAllPublishedCuratedSets(Ref ref) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getPublishedCuratedSets();
}
