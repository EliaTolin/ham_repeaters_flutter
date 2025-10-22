import 'package:quiz_radioamatori/src/features/quiz/data/mappers/quiz_set_response_mappers.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_response_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'quiz_supabase_datasource.g.dart';

class QuizSupabaseDataSource {
  QuizSupabaseDataSource(this._supabase);
  final SupabaseClient _supabase;
  final QuizSetResponseMapper _mapper = QuizSetResponseMapper();

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

      return _mapper.fromModel(model);
    } catch (e) {
      throw Exception('Failed to get quiz set: $e');
    }
  }
}

@riverpod
QuizSupabaseDataSource quizDataSource(Ref ref) {
  final supabase = Supabase.instance.client;
  return QuizSupabaseDataSource(supabase);
}
