import 'package:quiz_radioamatori/src/features/quiz/data/datasource/quiz_answers_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'quiz_answers_datasource_provider.g.dart';

@riverpod
QuizAnswersDataSource quizAnswersDataSource(Ref ref) {
  final supabase = Supabase.instance.client;
  return QuizAnswersDataSource(supabase);
}
