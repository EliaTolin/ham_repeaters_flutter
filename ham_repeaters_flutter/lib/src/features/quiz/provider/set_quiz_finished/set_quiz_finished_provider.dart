import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_quiz_finished_provider.g.dart';

@riverpod
Future<void> setQuizFinished(Ref ref, String setId) async {
  final repository = ref.read(quizRepositoryProvider);
  await repository.setQuizFinished(setId);
}
