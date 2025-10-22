import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_quiz_set_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  FutureOr<Map<String, dynamic>?> build() async {
    return null;
  }

  Future<void> generateQuizSet(ExamType examType) async {
    state = const AsyncLoading();

    try {
      final userId = await ref.read(getUserIdProvider.future);

      if (userId == null) {
        throw Exception('User ID not found');
      }

      state = await AsyncValue.guard(() async {
        final result = await ref.read(
          getQuizSetProvider(
            examType: examType,
            userId: userId,
          ).future,
        );

        return result;
      });
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
