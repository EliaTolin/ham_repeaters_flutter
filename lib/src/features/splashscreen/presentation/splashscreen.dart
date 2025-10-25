import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/resources/resources.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/presentation/controller/splash_controller.dart';

@RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() async {
      try {
        final route = await ref.read(splashControllerProvider.future);
        if (context.mounted) {
          await context.router.replace(route);
        }
      } catch (e) {
        // await Sentry.captureException(e);
        // if (context.mounted) {
        //   await context.router.replace(const HomeRoute());
        // }
      }
    });
    return Scaffold(
      body: Center(child: SvgPicture.asset(SvgImageAssets.aurora, width: 200, height: 200)),
    );
  }
}
