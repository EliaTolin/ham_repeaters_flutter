import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_quiz_scores_provider.g.dart';

@riverpod
Future<List<QuizSetScore>> recentQuizScores(Ref ref, {int limit = 3}) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getRecentQuizScores(limit: limit);
}
