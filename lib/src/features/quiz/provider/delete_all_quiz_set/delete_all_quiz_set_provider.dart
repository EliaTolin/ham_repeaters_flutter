import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_all_quiz_set_provider.g.dart';

@riverpod
Future<void> deleteAllQuizSet(Ref ref, String userId) async {
  final repository = ref.read(quizRepositoryProvider);
  await repository.deleteAllQuizSet(userId);
}
