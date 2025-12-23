import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quiz_results_provider.g.dart';

@riverpod
Future<QuizSetScore> getQuizResults(Ref ref, String setId) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getQuizResults(setId);
}
