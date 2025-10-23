import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_supabase_datasource.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_score_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository(this._dataSource);
  final QuizSupabaseDataSource _dataSource;
  final QuizSetScoreMapper _scoreMapper = QuizSetScoreMapper();

  Future<QuizSetResponse> getQuizSet({
    required ExamType examType,
    required String userId,
  }) async {
    return _dataSource.getQuizSet(
      examType: examType,
      userId: userId,
    );
  }

  Future<QuizSetScore?> getQuizResults(String setId) async {
    final model = await _dataSource.getQuizResults(setId);
    if (model == null) return null;
    return _scoreMapper.fromModel(model);
  }
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  final dataSource = ref.watch(quizDataSourceProvider);
  return QuizRepository(dataSource);
}
