import 'package:ham_repeaters/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_response/quiz_set_response.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_request/topic_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_custom_quiz_set_provider.g.dart';

@riverpod
Future<QuizSetResponse> getCustomQuizSet(
  Ref ref, {
  required List<TopicRequest> topics,
  required String userId,
}) async {
  final repository = ref.read(quizRepositoryProvider);
  final result = await repository.getCustomQuizSet(
    topics: topics,
    userId: userId,
  );

  return result;
}
