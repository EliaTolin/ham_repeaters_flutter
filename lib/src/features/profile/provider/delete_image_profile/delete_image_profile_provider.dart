import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/data/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_image_profile_provider.g.dart';

@riverpod
Future<void> deleteImageProfile(Ref ref) async {
  final repository = ref.read(profileRepositoryProvider);
  final userId = await ref.read(getUserIdProvider.future);
  return repository.deleteImagePropic(userId!);
}
