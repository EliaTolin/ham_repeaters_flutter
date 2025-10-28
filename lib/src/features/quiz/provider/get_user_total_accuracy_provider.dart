import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/total_accuracy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_total_accuracy_provider.g.dart';

@riverpod
Future<TotalAccuracy?> getUserTotalAccuracy(Ref ref, String userId) async {
  final repository = ref.read(quizRepositoryProvider);
  return repository.getUserTotalAccuracy(userId);
}
