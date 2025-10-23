import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            NavigationDestination(icon: Icon(Icons.person), label: 'Profilo'),
          ],
        );
      },
    );
  }
}
