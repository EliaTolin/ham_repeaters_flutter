import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_datasource_supabase.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_question_result_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_score_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/topic_accuracy_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/topic_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/topic_with_stats_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/mappers/total_accuracy_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_question_result.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_accuracy.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_request.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_with_stats.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/total_accuracy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository(this._dataSource);
  final QuizDataSourceSupabase _dataSource;
  final QuizSetScoreMapper _scoreMapper = QuizSetScoreMapper();
  final TopicMapper _topicMapper = TopicMapper();
  final TopicWithStatsMapper _topicWithStatsMapper = TopicWithStatsMapper();
  final TopicAccuracyMapper _topicAccuracyMapper = TopicAccuracyMapper();
  final TotalAccuracyMapper _totalAccuracyMapper = TotalAccuracyMapper();

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

  // Custom Quiz Set method
  Future<QuizSetResponse> getCustomQuizSet({
    required List<TopicRequest> topics,
    required String userId,
  }) async {
    return _dataSource.getCustomQuizSet(
      topics: topics,
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

  // Get quiz answers with results
  Future<List<QuizSetQuestionResultModel>> getQuizAnswersWithResults(String setId) async {
    return _dataSource.getQuizAnswersWithResults(setId);
  }

  // Get Topics
  Future<List<Topic>> getTopics() async {
    final models = await _dataSource.getTopics();
    return models.map(_topicMapper.fromModel).toList();
  }

  // Get Topics with Stats
  Future<List<TopicWithStats>> getTopicsWithStats() async {
    final models = await _dataSource.getTopicsWithStats();
    return models.map(_topicWithStatsMapper.fromModel).toList();
  }

  // Get User Topic Accuracy
  Future<List<TopicAccuracy>> getUserTopicAccuracy(String userId) async {
    final models = await _dataSource.getUserTopicAccuracy(userId);
    return models.map(_topicAccuracyMapper.fromModel).toList();
  }

  // Get User Total Accuracy
  Future<TotalAccuracy?> getUserTotalAccuracy(String userId) async {
    final model = await _dataSource.getUserTotalAccuracy(userId);
    if (model == null) return null;
    return _totalAccuracyMapper.fromModel(model);
  }

  Future<void> setQuizFinished(String setId) async {
    return _dataSource.setQuizFinished(setId);
  }
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  final dataSource = ref.watch(quizDataSourceSupabaseProvider);
  return QuizRepository(dataSource);
}
