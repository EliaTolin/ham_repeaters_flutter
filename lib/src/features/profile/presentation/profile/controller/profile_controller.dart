import 'dart:developer';

import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/logout_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/state/user_state.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_email_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_image_profile_provider.dart';
import 'package:quiz_radioamatori/src/features/profile/provider/get_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
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

  Future<void> logout() async {
    await ref.read(logoutProvider.future);
    log('User logged out');
    ref.invalidate(getUserIdProvider);
  }
}
