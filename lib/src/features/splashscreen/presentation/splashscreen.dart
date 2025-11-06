import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_radioamatori/clients/package_info/package_info.dart';
import 'package:quiz_radioamatori/common/dialogs/show_update_required_dialog.dart';
import 'package:quiz_radioamatori/common/utils/version_utils.dart';
import 'package:quiz_radioamatori/config/app_configs.dart';
import 'package:quiz_radioamatori/resources/resources.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/params/provider/get_params/get_params_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/errors/update_required_exception.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/get_has_seen_onboarding/get_has_seen_onboarding_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var _navigated = false;

  @override
  void initState() {
    super.initState();
    _initializeNavigation();
  }

  Future<void> _initializeNavigation() async {
    try {
      final onboarding = await ref.read(getHasSeenOnboardingProvider.future);
      var userID = await ref.read(getUserIdProvider.future);
      userID ??= await ref.read(anonymousSignInProvider.future);
      final PageRouteInfo route = onboarding ? const HomeRoute() : const OnboardingRoute();
      try {
        final packageInfo = await ref.read(packageInfoProvider.future);
        final installedVersion = packageInfo.version;

        final minVersionKey = Platform.isIOS ? 'min_version_app_store' : 'min_version_play_store';

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

      
      log('userId: $userID');
      if (userID != null) {
        Sentry.configureScope(
          (scope) => scope.setUser(SentryUser(id: userID)),
        );
      }
      if (mounted && !_navigated) {
        _navigated = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) context.router.pushAndPopUntil(route, predicate: (_) => false);
        });
      }
    } on UpdateRequiredException {
      if (mounted && !_navigated) {
        _navigated = true;
        // Read the future synchronously before async gap
        final packageInfoFuture = ref.read(packageInfoProvider.future);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final navigatorContext = context;
          if (mounted && navigatorContext.mounted) {
            try {
              final packageInfo = await packageInfoFuture;
              if (navigatorContext.mounted) {
                await showUpdateRequiredDialog(
                  navigatorContext,
                  appStoreId: AppConfigs.getAppStoreId(),
                  playStorePackageName: packageInfo.packageName,
                );
              }
            } catch (e) {
              // Provider was disposed, navigate to home as fallback
              if (navigatorContext.mounted) {
                await navigatorContext.router.replace(const HomeRoute());
              }
            }
          }
        });
      }
    } catch (e, stackTrace) {
      // ignore: unawaited_futures
      Sentry.captureException(e, stackTrace: stackTrace);

      if (mounted && !_navigated) {
        _navigated = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            context.router.replace(const HomeRoute());
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          SvgImageAssets.aurora,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
