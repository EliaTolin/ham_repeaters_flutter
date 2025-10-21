import 'dart:io';

import 'package:app_template/src/features/authentication/provider/delete_account_provider.dart';
import 'package:app_template/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:app_template/src/features/profile/data/repository/profile_repository.dart';
import 'package:app_template/src/features/profile/domain/profile.dart';
import 'package:app_template/src/features/profile/domain/state/user_state.dart';
import 'package:app_template/src/features/profile/provider/delete_image_profile_provider.dart';
import 'package:app_template/src/features/profile/provider/get_email_profile_provider.dart';
import 'package:app_template/src/features/profile/provider/get_image_profile_provider.dart';
import 'package:app_template/src/features/profile/provider/get_profile_provider.dart';
import 'package:app_template/src/features/profile/provider/update_profile_provider.dart';
import 'package:app_template/src/features/profile/provider/upload_propics_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_controller.g.dart';

@riverpod
class UserSettingsController extends _$UserSettingsController {
  @override
  FutureOr<UserState> build() async {
    state = const AsyncLoading();
    final profile = await ref.watch(getProfileProvider.future);
    String? imageUrl;
    if (profile.propic != null) {
      imageUrl = await ref.read(getImageProfileProvider(profile.propic!).future);
    }
    final email = await ref.read(getEmailProfileProvider.future);
    return UserState(profile: profile, imageProfileUrl: imageUrl, email: email);
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncLoading();
    await AsyncValue.guard(() async {
      await ref.read(updateProfileProvider(profile).future);
      ref.invalidate(profileRepositoryProvider);
    });
  }

  Future<void> updateImageProfile(File image) async {
    state = const AsyncLoading();
    await AsyncValue.guard(() async {
      await ref.read(uploadPropicsProvider(image).future);
      ref.invalidate(profileRepositoryProvider);
    });
  }

  Future<void> deleteImageProfile() async {
    state = const AsyncLoading();
    await AsyncValue.guard(() async {
      await ref.read(deleteImageProfileProvider.future);
      ref.invalidate(profileRepositoryProvider);
    });
  }

  Future<void> deleteAccount() async {
    await ref.read(deleteAccountProvider.future);
    ref.invalidate(getUserIdProvider);
  }
}
