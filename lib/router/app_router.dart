import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/auth_screen.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/change_password/change_password_screen.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/home/presentation/home_page.dart';
import 'package:quiz_radioamatori/src/features/onboarding/presentation/onboarding_page.dart';
import 'package:quiz_radioamatori/src/features/profile/presentation/profile/profile_screen.dart';
import 'package:quiz_radioamatori/src/features/profile/presentation/user_settings/user_settings_screen.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_request.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/custom_quiz_builder/custom_quiz_builder_page.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_answers/quiz_answers_page.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/quiz_dashboard_page.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/quiz_page.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/quiz_results_page.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/quiz_statistics_page.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/presentation/splashscreen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter implements AutoRouteGuard {
  AppRouter(this.ref);
  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(path: '/change-password', page: ChangePasswordRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          guards: [this],
          children: [
            AutoRoute(
              page: const EmptyShellRoute('MainRouter'),
              children: [
                AutoRoute(
                  page: QuizDashboardRoute.page,
                ),
                AutoRoute(
                  page: QuizResultsRoute.page,
                ),
                AutoRoute(
                  page: QuizStatisticsRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: const EmptyShellRoute('ProfileRouter'),
              children: [
                AutoRoute(page: ProfileRoute.page),
                AutoRoute(page: UserSettingsRoute.page),
              ],
            ),
          ],
        ),
        // Quiz route as a separate full-screen route
        AutoRoute(
          page: QuizRoute.page,
          guards: [this],
        ),
        // Custom quiz builder route
        AutoRoute(
          page: CustomQuizBuilderRoute.page,
          guards: [this],
        ),
        // Quiz answers route as a separate full-screen route
        AutoRoute(
          page: QuizAnswersRoute.page,
          guards: [this],
        ),
      ];

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Check if the route is splash or login page
    final isRequiredAuth = switch (resolver.route.name) {
      SplashRoute.name => false,
      AuthRoute.name => false,
      ChangePasswordRoute.name => false,
      _ => true,
    };

    // If the route is not required auth, go to next route
    if (!isRequiredAuth) {
      return resolver.next();
    }

    // Check permission
    var isAuthenticated = false;
    try {
      final value = await ref.read(getUserIdProvider.future);
      isAuthenticated = value != null;
      log('isAuthenticated: $isAuthenticated, go to next route: ${resolver.route.name}');
    } catch (e) {
      log(e.toString());
      isAuthenticated = false;
    }
    if (isAuthenticated) {
      resolver.next();
    } else {
      await resolver.redirectUntil(const AuthRoute(), replace: true);
    }
  }
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
AppRouter appRouter(Ref ref) {
  return AppRouter(ref);
}
