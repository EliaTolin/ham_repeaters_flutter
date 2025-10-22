import 'dart:io';

import 'package:quiz_radioamatori/src/features/authentication/provider/delete_account_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/state/user_state.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/delete_image_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_email_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_image_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/update_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/upload_propics_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_controller.g.dart';

@Riverpod(keepAlive: true)
class UserSettingsController extends _$UserSettingsController {
  @override
  FutureOr<UserState> build() async {
    state = const AsyncLoading();
    final profile = await ref.read(getProfileProvider.future);
    return await getProfile(profile);
  }

  Future<UserState> getProfile(Profile profile) async {
    state = const AsyncLoading();
    String? imageUrl;
    if (profile.propic != null) {
      imageUrl = await ref.read(getImageProfileProvider(profile.propic!).future);
    }
    final email = await ref.read(getEmailProfileProvider.future);
    return UserState(profile: profile, imageProfileUrl: imageUrl, email: email);
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(updateProfileProvider(profile).future);
      ref.invalidate(getProfileProvider);
      final newProfile = await ref.read(getProfileProvider.future);
      return getProfile(newProfile);
    });
  }

  Future<void> updateImageProfile(File image) async {
    state = const AsyncLoading();
    await ref.read(uploadPropicsProvider(image).future);
  }

  Future<void> deleteImageProfile() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(deleteImageProfileProvider.future);
      final profile = await ref.watch(getProfileProvider.future);
      return getProfile(profile);
    });
  }

  Future<void> deleteAccount() async {
    await ref.read(deleteAccountProvider.future);
    ref.invalidate(getUserIdProvider);
  }
}
