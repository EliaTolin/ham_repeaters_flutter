import 'dart:developer';

import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_response_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_question_result_model/quiz_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model/quiz_set_question_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_response_model/quiz_set_response_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_score_model/quiz_set_score_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_accuracy_model/topic_accuracy_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_model/topic_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/topic_with_stats_model/topic_with_stats_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/total_accuracy_model/total_accuracy_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response/quiz_set_response.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_request/topic_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'quiz_datasource_supabase.g.dart';

class QuizDataSourceSupabase {
  QuizDataSourceSupabase(this._supabase);
  final SupabaseClient _supabase;
  final QuizSetResponseMapper _responseMapper = QuizSetResponseMapper();

  // Quiz Set methods (from QuizSupabaseDataSource)
  Future<QuizSetResponse> getQuizSet({
    required ExamType examType,
    required String userId,
  }) async {
    try {
      final response = await _supabase.functions.invoke(
        'get_quiz_set',
        body: {
          'exam_type': examType.value,
          'user_id': userId,
        },
      );

      if (response.data == null) {
        throw Exception('No data received from edge function');
      }

      final data = response.data as Map<String, dynamic>;

      if (data['success'] != true) {
        throw Exception('Edge function returned error: ${data['error'] ?? 'Unknown error'}');
      }

      final result = data['data'] as Map<String, dynamic>;
      final model = QuizSetResponseModel.fromJson(result);

      return _responseMapper.fromModel(model);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get quiz set: $e');
    }
  }

  // Custom Quiz Set method
  Future<QuizSetResponse> getCustomQuizSet({
    required List<TopicRequest> topics,
    required String userId,
  }) async {
    try {
      final topicsJson = topics
          .map(
            (topic) => {
              'topic': topic.topic,
              'num_questions': topic.numQuestions,
            },
          )
          .toList();

      final response = await _supabase.functions.invoke(
        'get_custom_quiz_set',
        body: {
          'topics': topicsJson,
          'user_id': userId,
        },
      );

      if (response.data == null) {
        throw Exception('No data received from edge function');
      }

      final data = response.data as Map<String, dynamic>;

      if (data['success'] != true) {
        throw Exception('Edge function returned error: ${data['error'] ?? 'Unknown error'}');
      }

      final result = data['data'] as Map<String, dynamic>;
      final model = QuizSetResponseModel.fromJson(result);

      return _responseMapper.fromModel(model);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      log('Failed to get custom quiz set: $e');
      throw Exception('Failed to get custom quiz set: $e');
    }
  }

  Future<QuizSetScoreModel?> getQuizResults(String setId) async {
    try {
      final response =
          await _supabase.from('quiz_set_score').select().eq('set_id', setId).maybeSingle();

      if (response == null) return null;

      return QuizSetScoreModel.fromJson(response);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get quiz results: $e');
    }
  }

  Future<void> saveQuizResults({
    required String setId,
    required List<Map<String, dynamic>> results,
  }) async {
    try {
      // Insert all results at once
      await _supabase.from('quiz_set_question_result').insert(results);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to save quiz results: $e');
    }
  }

  Future<List<QuizSetScoreModel>> getAllQuizScores() async {
    try {
      final response =
          await _supabase.from('quiz_set_score').select().order('set_id', ascending: false);

      return (response as List).map((json) => QuizSetScoreModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get all quiz scores: $e');
    }
  }

  Future<List<QuizSetScoreModel>> getRecentQuizScores({int limit = 3}) async {
    try {
      final response = await _supabase
          .from('quiz_set_score')
          .select()
          .order('set_id', ascending: false)
          .limit(limit);

      return (response as List).map((json) => QuizSetScoreModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get recent quiz scores: $e');
    }
  }

  Future<List<QuizQuestionResultModel>> getQuestionStatistics() async {
    try {
      final response = await _supabase
          .from('quiz_set_question_result')
          .select()
          .order('answered_at', ascending: false);

      return (response as List).map((json) => QuizQuestionResultModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get question statistics: $e');
    }
  }

  // Quiz Answers methods (from QuizAnswersDataSource)
  Future<void> saveAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  }) async {
    try {
      await _supabase.from('quiz_set_question').upsert({
        'set_id': setId,
        'question_id': questionId,
        'chosen_letter': chosenLetter,
        'answered_at': DateTime.now().toIso8601String(),
        'time_ms': timeMs,
      });
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to save answer: $e');
    }
  }

  Future<void> updateAnswer({
    required String setId,
    required int questionId,
    required String chosenLetter,
    required int timeMs,
  }) async {
    try {
      await _supabase
          .from('quiz_set_question')
          .update({
            'chosen_letter': chosenLetter,
            'answered_at': DateTime.now().toIso8601String(),
            'time_ms': timeMs,
          })
          .eq('set_id', setId)
          .eq('question_id', questionId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to update answer: $e');
    }
  }

  Future<void> deleteAnswer({
    required String setId,
    required int questionId,
  }) async {
    try {
      await _supabase
          .from('quiz_set_question')
          .delete()
          .eq('set_id', setId)
          .eq('question_id', questionId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to delete answer: $e');
    }
  }

  Future<List<QuizSetQuestionModel>> getAnswers(String setId) async {
    try {
      final response = await _supabase.from('quiz_set_question').select().eq('set_id', setId);

      return (response as List).map((json) => QuizSetQuestionModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get answers: $e');
    }
  }

  Future<void> deleteQuizAnswers(String setId) async {
    try {
      await _supabase.from('quiz_set_question').delete().eq('set_id', setId);
      await _supabase.from('quiz_set').delete().eq('id', setId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to delete quiz answers: $e');
    }
  }

  // Get quiz answers with results from the view
  Future<List<QuizSetQuestionResultModel>> getQuizAnswersWithResults(String setId) async {
    try {
      // Try to query the view first
      final response = await _supabase
          .from('quiz_set_question_result')
          .select()
          .eq('set_id', setId)
          .order('question_id', ascending: true);

      final results =
          (response as List).map((json) => QuizSetQuestionResultModel.fromJson(json)).toList();
      return results;
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get quiz answers with results: $e');
    }
  }

  // Get Topics
  Future<List<TopicModel>> getTopics() async {
    try {
      final response = await _supabase.from('topic').select();

      return (response as List).map((json) => TopicModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get topics: $e');
    }
  }

  // Get Topics with Stats
  Future<List<TopicWithStatsModel>> getTopicsWithStats() async {
    try {
      final response = await _supabase.from('topic_question_stats').select();

      return (response as List).map((json) => TopicWithStatsModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get topics with stats: $e');
    }
  }

  // Get user topic accuracy
  Future<List<TopicAccuracyModel>> getUserTopicAccuracy(String userId) async {
    try {
      final response = await _supabase.rpc('user_topic_accuracy', params: {'p_user_id': userId});
      return (response as List).map((json) => TopicAccuracyModel.fromJson(json)).toList();
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get user topic accuracy: $e');
    }
  }

  // Get user total accuracy
  Future<TotalAccuracyModel?> getUserTotalAccuracy(String userId) async {
    try {
      final response =
          await _supabase.rpc('user_total_accuracy', params: {'p_user_id': userId}).maybeSingle();

      if (response == null) return null;
      return TotalAccuracyModel.fromJson(response);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to get user total accuracy: $e');
    }
  }

  Future<void> setQuizFinished(String setId) async {
    try {
      await _supabase.from('quiz_set').update({
        'finished_at': DateTime.now().toIso8601String(),
      }).eq('id', setId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to set finished quiz: $e');
    }
  }

  Future<void> deleteAllQuizSet(String userId) async {
    try {
      await _supabase.from('quiz_set').delete().eq('user_id', userId);
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      throw Exception('Failed to delete all quiz sets: $e');
    }
  }
}

@riverpod
QuizDataSourceSupabase quizDataSourceSupabase(Ref ref) {
  final supabase = Supabase.instance.client;
  return QuizDataSourceSupabase(supabase);
}
