import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:quiz_radioamatori/clients/mobile_ads/mobile_ads_client.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/get_has_seen_onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<PageRouteInfo> build() async {
    await ref.read(mobileAdsProvider.future);
    final onboarding = await ref.read(getHasSeenOnboardingProvider.future);
    final userID = await ref.read(getUserIdProvider.future);
    log('userID: $userID');
    await Future.delayed(const Duration(seconds: 1));

    if (onboarding) {
      return const HomeRoute();
    } else {
      return const OnboardingRoute();
    }
  }
}
