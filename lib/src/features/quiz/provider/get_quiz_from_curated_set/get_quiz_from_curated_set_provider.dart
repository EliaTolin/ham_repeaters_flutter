import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response/quiz_set_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quiz_from_curated_set_provider.g.dart';

@riverpod
Future<QuizSetResponse> getQuizFromCuratedSet(
  Ref ref,
  String curatedSetId,
) async {
  final userId = await ref.read(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User ID not found for get quiz from curated set');
  }
  final repository = ref.read(quizRepositoryProvider);
  return repository.getQuizFromCuratedSet(userId, curatedSetId);
}
