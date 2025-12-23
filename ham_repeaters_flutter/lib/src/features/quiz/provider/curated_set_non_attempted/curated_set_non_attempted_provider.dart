import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'curated_set_non_attempted_provider.g.dart';

@riverpod
Future<List<CuratedSetPreview>> curatedSetNonAttempted(
  Ref ref,
  String userId,
) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getCuratedSetsNonAttemptedByUser(userId);
}
