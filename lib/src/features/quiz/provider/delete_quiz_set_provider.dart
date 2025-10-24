import 'package:quiz_radioamatori/src/features/quiz/provider/quiz_answers_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_quiz_set_provider.g.dart';

@riverpod
Future<void> deleteQuizSet(Ref ref, String quizSetId) async {
  final quizAnswersRepository = ref.read(quizAnswersRepositoryProvider);
  await quizAnswersRepository.deleteQuizAnswers(quizSetId);
}
