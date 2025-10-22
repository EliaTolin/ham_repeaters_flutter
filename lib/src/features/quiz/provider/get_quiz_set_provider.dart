import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quiz_set_provider.g.dart';

@riverpod
Future<Map<String, dynamic>> getQuizSet(
  Ref ref, {
  required ExamType examType,
  required String userId,
}) async {
  final repository = ref.read(quizRepositoryProvider);
  final result = await repository.getQuizSet(
    examType: examType,
    userId: userId,
  );

  return {
    'quizSetId': result.quizSetId,
    'questions': result.questions,
    'totalQuestions': result.totalQuestions,
  };
}
