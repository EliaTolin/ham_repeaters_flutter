import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:quiz_radioamatori/clients/package_info/package_info.dart';
import 'package:quiz_radioamatori/common/utils/version_utils.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/params/provider/get_params/get_params_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/errors/update_required_exception.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/get_has_seen_onboarding/get_has_seen_onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<PageRouteInfo> build() async {
    //await ref.read(mobileAdsProvider.future);

    try {
      final packageInfo = await ref.read(packageInfoProvider.future);
      final installedVersion = packageInfo.version;

      final minVersionKey =
          Platform.isIOS ? 'min_version_app_store' : 'min_version_play_store';

      final minVersionParam = await ref.read(
        getParamByKeyProvider(minVersionKey).future,
      );

      if (minVersionParam != null) {
        final minVersion = minVersionParam.value;
        if (isVersionOutdated(installedVersion, minVersion)) {
          log(
            'Versione installata ($installedVersion) è inferiore alla minima richiesta ($minVersion)',
          );
          // Lancia un'eccezione speciale che verrà gestita nello splash screen
          throw UpdateRequiredException(
            minVersion: minVersion,
            installedVersion: installedVersion,
          );
        }
      }
    } on UpdateRequiredException {
      rethrow;
    } catch (e, stackTrace) {
      log('Errore durante il controllo versione: $e');
      await Sentry.captureException(e, stackTrace: stackTrace);
    }

    final onboarding = await ref.read(getHasSeenOnboardingProvider.future);
    var userID = await ref.read(getUserIdProvider.future);
    userID ??= await ref.read(anonymousSignInProvider.future);
    log('userId: $userID');
    if (userID != null) {
      Sentry.configureScope(
        (scope) => scope.setUser(SentryUser(id: userID)),
      );
    }
    if (onboarding) {
      return const HomeRoute();
    } else {
      return const OnboardingRoute();
    }
  }
}
