import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_supabase_datasource.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_question_result_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_score_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_question_result.dart';
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

  Future<void> saveQuizResults({
    required String setId,
    required List<Map<String, dynamic>> results,
  }) async {
    return _dataSource.saveQuizResults(
      setId: setId,
      results: results,
    );
  }

  Future<List<QuizSetScore>> getAllQuizScores() async {
    final models = await _dataSource.getAllQuizScores();
    return models.map(_scoreMapper.fromModel).toList();
  }

  Future<List<QuizSetScore>> getRecentQuizScores({int limit = 3}) async {
    final models = await _dataSource.getRecentQuizScores(limit: limit);
    return models.map(_scoreMapper.fromModel).toList();
  }

  Future<List<QuizQuestionResult>> getQuestionStatistics() async {
    final resultMapper = QuizQuestionResultMapper();
    final models = await _dataSource.getQuestionStatistics();
    return models.map(resultMapper.fromModel).toList();
  }
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  final dataSource = ref.watch(quizDataSourceProvider);
  return QuizRepository(dataSource);
}
