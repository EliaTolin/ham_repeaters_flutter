import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/resources/resources.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/presentation/controller/splash_controller.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        var cancelled = false;
        var navigated = false;

        Future(() async {
          try {
            final route = await ref.read(splashControllerProvider.future);
            if (!cancelled && context.mounted && !navigated) {
              navigated = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) context.router.replace(route);
              });
            }
          } catch (e, stackTrace) {
            // Non bloccare la UI sulla cattura
            // ignore: unawaited_futures
            Sentry.captureException(e, stackTrace: stackTrace);

            if (!cancelled && context.mounted && !navigated) {
              navigated = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  context.router.replace(const HomeRoute());
                }
              });
            }
          }
        });

        return () => cancelled = true;
      },
      const [],
    );

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(SvgImageAssets.aurora, width: 200, height: 200),
      ),
    );
  }
}
