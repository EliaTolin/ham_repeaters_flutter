import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_radioamatori/common/dialogs/show_update_required_dialog.dart';
import 'package:quiz_radioamatori/resources/resources.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/presentation/controller/splash_controller.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<AsyncValue<SplashAction?>>(
        splashControllerProvider,
        (previous, next) {
          next.whenData((action) {
            if (action == null) return;

            WidgetsBinding.instance.addPostFrameCallback((_) async {
              final notifier = ref.read(splashControllerProvider.notifier);
              if (!context.mounted) return;

              switch (action.type) {
                case SplashActionType.navigate:
                  final route = action.route ?? const HomeRoute();
                  await context.router.replaceAll([route]);
                case SplashActionType.updateDialog:
                  final dialogData = action.updateDialogData;
                  if (dialogData == null) {
                    notifier.clearAction();
                    return;
                  }
                  try {
                    await showUpdateRequiredDialog(
                      context,
                      appStoreId: dialogData.appStoreId,
                      playStorePackageName: dialogData.playStorePackageName,
                    );
                  } catch (error, stackTrace) {
                    await Sentry.captureException(error, stackTrace: stackTrace);
                  }
                  if (!context.mounted) return;
                  await context.router.replace(dialogData.fallbackRoute);
              }

              notifier.clearAction();
            });
          });
        },
      )
      ..watch(splashControllerProvider);

    return const _SplashView();
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

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
