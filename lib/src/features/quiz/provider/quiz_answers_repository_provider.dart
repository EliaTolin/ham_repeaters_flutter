import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_answers_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/quiz_answers_datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_answers_repository_provider.g.dart';

@riverpod
QuizAnswersRepository quizAnswersRepository(Ref ref) {
  final dataSource = ref.watch(quizAnswersDataSourceProvider);
  return QuizAnswersRepositoryImpl(dataSource);
}
