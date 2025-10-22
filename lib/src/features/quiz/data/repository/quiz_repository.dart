import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_supabase_datasource.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository(this._dataSource);
  final QuizSupabaseDataSource _dataSource;

  Future<QuizSetResponse> getQuizSet({
    required ExamType examType,
    required String userId,
  }) async {
    return _dataSource.getQuizSet(
      examType: examType,
      userId: userId,
    );
  }
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  final dataSource = ref.watch(quizDataSourceProvider);
  return QuizRepository(dataSource);
}
