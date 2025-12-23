import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ham_repeaters/common/dialogs/show_update_required_dialog.dart';
import 'package:ham_repeaters/resources/resources.dart';
import 'package:ham_repeaters/router/app_router.dart';
import 'package:ham_repeaters/src/features/splashscreen/presentation/controller/splash_controller.dart';
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
                    await Sentry.captureException(
                      error,
                      stackTrace: stackTrace,
                    );
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
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withValues(alpha: 0.85),
              colorScheme.secondary.withValues(alpha: 0.65),
              colorScheme.surface,
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -120,
              left: -80,
              child: _BlurCircle(
                diameter: 260,
                color: colorScheme.onPrimary.withValues(alpha: 0.08),
              ),
            ),
            Positioned(
              right: -100,
              bottom: -140,
              child: _BlurCircle(
                diameter: 320,
                color: colorScheme.primaryContainer.withValues(alpha: 0.12),
              ),
            ),
            Center(
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 900),
                tween: Tween(begin: 0.8, end: 1),
                curve: Curves.easeOutBack,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorScheme.surface.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withValues(alpha: 0.12),
                            offset: const Offset(0, 18),
                            blurRadius: 36,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 36,
                        ),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOutCubic,
                          builder: (context, opacity, child) {
                            return Opacity(
                              opacity: opacity,
                              child: child,
                            );
                          },
                          child: SvgPicture.asset(
                            SvgImageAssets.aurora,
                            width: 180,
                            height: 180,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 1000),
                      tween: Tween(begin: 0, end: 1),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 16),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            'Ham Repeaters',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: colorScheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Loading...',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSecondaryContainer,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colorScheme.onSecondaryContainer,
                              ),
                              strokeWidth: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlurCircle extends StatelessWidget {
  const _BlurCircle({
    required this.diameter,
    required this.color,
  });

  final double diameter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: diameter * 0.35,
            spreadRadius: diameter * 0.25,
          ),
        ],
      ),
    );
  }
}
