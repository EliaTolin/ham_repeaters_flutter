import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository_provider.g.dart';

@riverpod
QuizRepository quizRepository(Ref ref) {
  final dataSource = ref.watch(quizDataSourceProvider);
  return QuizRepository(dataSource);
}
