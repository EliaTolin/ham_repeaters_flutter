import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_response/quiz_set_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quiz_set_provider.g.dart';

@riverpod
Future<QuizSetResponse> getQuizSet(
  Ref ref, {
  required ExamType examType,
  required String userId,
}) async {
  final repository = ref.read(quizRepositoryProvider);
  final result = await repository.getQuizSet(
    examType: examType,
    userId: userId,
  );

  return result;
}
