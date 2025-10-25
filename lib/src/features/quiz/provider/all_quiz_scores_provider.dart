import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/quiz_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_quiz_scores_provider.g.dart';

@riverpod
Future<List<QuizSetScore>> allQuizScores(Ref ref) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getAllQuizScores();
}
