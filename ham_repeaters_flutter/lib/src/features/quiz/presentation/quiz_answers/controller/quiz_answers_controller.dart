import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';
import 'package:ham_repeaters/src/features/quiz/provider/quiz_answers/quiz_answers_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'quiz_answers_controller.g.dart';

@riverpod
class QuizAnswersController extends _$QuizAnswersController {
  @override
  Future<List<QuizSetQuestionResult>> build(String setId) async {
    try {
      final answers = await ref.read(quizAnswersProvider(setId).future);
      return answers;
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      rethrow;
    }
  }
}
