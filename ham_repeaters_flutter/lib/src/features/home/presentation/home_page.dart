import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ham_repeaters/common/dialogs/show_telegram_invite_dialog.dart';
import 'package:ham_repeaters/router/app_router.dart';
import 'package:ham_repeaters/src/features/home/presentation/controller/home_controller.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);

    return controller.when(
      data: (state) {
        useMemoized(
          () async {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) async {
                await Future.delayed(const Duration(seconds: 2));
                if (state.showTelegram && context.mounted) {
                  final controller = ref.read(homeControllerProvider.notifier);
                  await showTelegramInviteDialog(
                    context,
                    onAlreadyTelegramMember: () async {
                      await controller.setTelegramGroupMember();
                    },
                  );
                  await controller.setTelegramInviteLastShownDate();
                }
              },
            );
          },
        );

        return AutoTabsScaffold(
          routes: const [
            QuizDashboardRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
              backgroundColor: Colors.white,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.quiz), label: 'Quiz'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Profilo'),
              ],
            );
          },
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
