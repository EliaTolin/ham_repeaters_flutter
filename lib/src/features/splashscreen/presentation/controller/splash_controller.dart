import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/get_has_seen_onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<PageRouteInfo> build() async {
    //await ref.read(mobileAdsProvider.future);
    final onboarding = await ref.read(getHasSeenOnboardingProvider.future);
    var userID = await ref.read(getUserIdProvider.future);
    userID ??= await ref.read(anonymousSignInProvider.future);
    log('userId: $userID');
    return const OnboardingRoute();
    if (onboarding) {
      return const HomeRoute();
    } else {
      return const OnboardingRoute();
    }
  }
}
