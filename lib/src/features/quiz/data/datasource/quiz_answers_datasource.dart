import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuizAnswersDataSource {
  QuizAnswersDataSource(this._supabase);
  final SupabaseClient _supabase;

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
