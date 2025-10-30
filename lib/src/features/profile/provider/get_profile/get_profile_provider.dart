import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/data/repository/profile_repository.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_provider.g.dart';

@riverpod
Future<Profile> getProfile(Ref ref) async {
  final repository = ref.watch(profileRepositoryProvider);
  final userId = await ref.read(getUserIdProvider.future);
  final response = await repository.getProfile(userId!);
  return response;
}
