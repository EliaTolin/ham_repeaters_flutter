import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_question_result_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_score_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_question_result.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository(this._dataSource);
  final QuizDataSource _dataSource;
  final QuizSetScoreMapper _scoreMapper = QuizSetScoreMapper();

  // Quiz Set methods
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

  // Quiz Answers methods
  Future<void> saveAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  }) async {
    return _dataSource.saveAnswer(
      setId: setId,
      questionId: questionId,
      chosenLetter: chosenLetter,
      timeMs: timeMs,
    );
  }

  Future<void> updateAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  }) async {
    return _dataSource.updateAnswer(
      setId: setId,
      questionId: questionId,
      chosenLetter: chosenLetter,
      timeMs: timeMs,
    );
  }

  Future<void> deleteAnswer({
    required String setId,
    required int questionId,
  }) async {
    return _dataSource.deleteAnswer(
      setId: setId,
      questionId: questionId,
    );
  }

  Future<List<QuizSetQuestionModel>> getAnswers(String setId) async {
    return _dataSource.getAnswers(setId);
  }

  Future<void> deleteQuizAnswers(String setId) async {
    return _dataSource.deleteQuizAnswers(setId);
  }
}
