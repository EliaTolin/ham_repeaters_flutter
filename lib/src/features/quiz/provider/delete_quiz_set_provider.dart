import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_quiz_set_provider.g.dart';

@riverpod
Future<void> deleteQuizSet(Ref ref, String quizSetId) async {
  final repository = ref.read(quizRepositoryProvider);
  await repository.deleteQuizAnswers(quizSetId);
}
