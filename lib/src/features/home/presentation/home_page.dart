import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const SimpleRoute(),
        QuizRoute(examType: ExamType.parziale),
        QuizRoute(examType: ExamType.completo),
        const ProfileRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          backgroundColor: Colors.white,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.quiz), label: 'Quiz'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profilo'),
          ],
        );
      },
    );
  }
}
