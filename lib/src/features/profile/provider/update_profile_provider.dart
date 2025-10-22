import 'package:quiz_radioamatori/src/features/profile/data/repository/profile_repository.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_provider.g.dart';

@riverpod
Future<void> updateProfile(Ref ref, Profile profile) async {
  final repository = ref.read(profileRepositoryProvider);
  await repository.updateProfile(profile);
}
