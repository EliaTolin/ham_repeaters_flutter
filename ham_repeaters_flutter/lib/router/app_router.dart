import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ham_repeaters/src/features/authentication/presentation/auth/auth_screen.dart';
import 'package:ham_repeaters/src/features/authentication/presentation/auth/change_password/change_password_screen.dart';
import 'package:ham_repeaters/src/features/home/presentation/home_page.dart';
import 'package:ham_repeaters/src/features/leaderboard/presentation/leaderboard_page.dart';
import 'package:ham_repeaters/src/features/onboarding/presentation/onboarding_page.dart';
import 'package:ham_repeaters/src/features/profile/presentation/profile/profile_screen.dart';
import 'package:ham_repeaters/src/features/profile/presentation/user_settings/user_settings_screen.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_request/topic_request.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/curated_sets_archive/curated_sets_archive_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/custom_quiz_builder/custom_quiz_builder_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/marathon_quiz/marathon_quiz_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_answers/quiz_answers_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/quiz_dashboard_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_page/quiz_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_results/quiz_results_page.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/statistics/quiz_statistics_page.dart';
import 'package:ham_repeaters/src/features/splashscreen/presentation/splashscreen.dart';
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
        // Marathon quiz route
        AutoRoute(
          page: MarathonQuizRoute.page,
          guards: [this],
        ),
        // Quiz answers route as a separate full-screen route
        AutoRoute(
          page: QuizAnswersRoute.page,
          guards: [this],
        ),
        // Curated sets archive
        AutoRoute(
          page: CuratedSetsArchiveRoute.page,
          guards: [this],
        ),
        // Leaderboard
        AutoRoute(
          page: LeaderboardRoute.page,
          guards: [this],
        ),
      ];

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    resolver.next();
    // // Check if the route is splash or login page
    // final isRequiredIsNotAnonymous = switch (resolver.route.name) {
    //   SplashRoute.name => false,
    //   AuthRoute.name => false,
    //   ChangePasswordRoute.name => false,
    //   QuizDashboardRoute.name => false,
    //   _ => true,
    // };

    // // If the route is not required auth, go to next route
    // if (!isRequiredIsNotAnonymous) {
    //   return resolver.next();
    // }

    // // Check permission
    // var isAnynoumous = true;
    // try {
    //   isAnynoumous = await ref.read(isAnonymousProvider.future);
    //   log('isAnonymous: $isAnynoumous, go to next route: ${resolver.route.name}');
    // } catch (e) {
    //   log(e.toString());
    //   isAnynoumous = true;
    // }
    // if (isRequiredIsNotAnonymous && !isAnynoumous) {
    //   await resolver.redirectUntil(const AuthRoute(), replace: true);
    // } else {
    //   resolver.next();
    // }
  }
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
AppRouter appRouter(Ref ref) {
  return AppRouter(ref);
}
