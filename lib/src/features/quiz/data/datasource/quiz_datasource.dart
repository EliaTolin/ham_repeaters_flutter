import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_response_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_response_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_score_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'quiz_datasource.g.dart';

class QuizDataSource {
  QuizDataSource(this._supabase);
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
    } catch (e) {
      throw Exception('Failed to get quiz set: $e');
    }
  }

  Future<QuizSetScoreModel?> getQuizResults(String setId) async {
    try {
      final response =
          await _supabase.from('quiz_set_score').select().eq('set_id', setId).maybeSingle();

      if (response == null) return null;

      return QuizSetScoreModel.fromJson(response);
    } catch (e) {
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
    } catch (e) {
      throw Exception('Failed to save quiz results: $e');
    }
  }

  Future<List<QuizSetScoreModel>> getAllQuizScores() async {
    try {
      final response =
          await _supabase.from('quiz_set_score').select().order('set_id', ascending: false);

      return (response as List).map((json) => QuizSetScoreModel.fromJson(json)).toList();
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
      throw Exception('Failed to delete answer: $e');
    }
  }

  Future<List<QuizSetQuestionModel>> getAnswers(String setId) async {
    try {
      final response = await _supabase.from('quiz_set_question').select().eq('set_id', setId);

      return (response as List).map((json) => QuizSetQuestionModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to get answers: $e');
    }
  }

  Future<void> deleteQuizAnswers(String setId) async {
    try {
      await _supabase.from('quiz_set_question').delete().eq('set_id', setId);
    } catch (e) {
      throw Exception('Failed to delete quiz answers: $e');
    }
  }
}

@riverpod
QuizDataSource quizDataSource(Ref ref) {
  final supabase = Supabase.instance.client;
  return QuizDataSource(supabase);
}
