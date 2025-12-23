import 'package:ham_repeaters/src/features/quiz/data/datasource/quiz_datasource_supabase.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/curated_set_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/curated_set_preview_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/quiz_set_question_result_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/quiz_set_score_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/topic_accuracy_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/topic_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/topic_with_stats_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/mappers/total_accuracy_mappers.dart';
import 'package:ham_repeaters/src/features/quiz/data/model/quiz_set_question_model/quiz_set_question_model.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set/curated_set.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_response/quiz_set_response.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic/topic.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_accuracy/topic_accuracy.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_request/topic_request.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_with_stats/topic_with_stats.dart';
import 'package:ham_repeaters/src/features/quiz/domain/total_accuracy/total_accuracy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository(this._dataSource);
  final QuizDataSourceSupabase _dataSource;
  final QuizSetScoreMapper _scoreMapper = QuizSetScoreMapper();
  final CuratedSetPreviewMapper _curatedSetPreviewMapper =
      CuratedSetPreviewMapper();
  final CuratedSetMapper _curatedSetMapper = CuratedSetMapper();
  final TopicMapper _topicMapper = TopicMapper();
  final TopicWithStatsMapper _topicWithStatsMapper = TopicWithStatsMapper();
  final TopicAccuracyMapper _topicAccuracyMapper = TopicAccuracyMapper();
  final TotalAccuracyMapper _totalAccuracyMapper = TotalAccuracyMapper();
  final QuizSetQuestionResultMapper _quizSetQuestionResultMapper =
      QuizSetQuestionResultMapper();

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

  Future<List<CuratedSetPreview>> getCuratedSetsNonAttemptedByUser(
      String userId) async {
    final models = await _dataSource.getCuratedSetsNonAttemptedByUser(userId);
    return models.map(_curatedSetPreviewMapper.fromModel).toList();
  }

  Future<List<CuratedSet>> getPublishedCuratedSets() async {
    final models = await _dataSource.getPublishedCuratedSets();
    return models.map(_curatedSetMapper.fromModel).toList();
  }

  Future<QuizSetScore> getQuizResults(String setId) async {
    final model = await _dataSource.getQuizResults(setId);
    if (model == null) throw Exception('Quiz results not found');
    return _scoreMapper.fromModel(model);
  }

  Future<List<QuizSetScore>> getAllQuizScores() async {
    final models = await _dataSource.getAllQuizScores();
    return models.map(_scoreMapper.fromModel).toList();
  }

  Future<List<QuizSetScore>> getRecentQuizScores({int limit = 3}) async {
    final models = await _dataSource.getRecentQuizScores(limit: limit);
    return models.map(_scoreMapper.fromModel).toList();
  }

  Future<List<QuizSetQuestionResult>> getQuestionStatistics() async {
    final models = await _dataSource.getQuestionStatistics();
    return models.map(_quizSetQuestionResultMapper.fromModel).toList();
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

  Future<void> deleteQuizSet(String setId) async {
    return _dataSource.deleteQuizSet(setId);
  }

  // Get quiz answers with results
  Future<List<QuizSetQuestionResult>> getQuizAnswersWithResults(
      String setId) async {
    final resultMapper = QuizSetQuestionResultMapper();
    final models = await _dataSource.getQuizAnswersWithResults(setId);
    return models.map(resultMapper.fromModel).toList();
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

  Future<void> deleteAllQuizSet(String userId) async {
    return _dataSource.deleteAllQuizSet(userId);
  }

  Future<QuizSetResponse> getQuizFromCuratedSet(
      String userId, String curatedSetId) async {
    return _dataSource.getQuizFromCuratedSet(userId, curatedSetId);
  }
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  final dataSource = ref.watch(quizDataSourceSupabaseProvider);
  return QuizRepository(dataSource);
}
