// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [QuizAnswersPage]
class QuizAnswersRoute extends PageRouteInfo<QuizAnswersRouteArgs> {
  QuizAnswersRoute({
    required String setId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizAnswersRoute.name,
          args: QuizAnswersRouteArgs(setId: setId, key: key),
          initialChildren: children,
        );

  static const String name = 'QuizAnswersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizAnswersRouteArgs>();
      return QuizAnswersPage(setId: args.setId, key: args.key);
    },
  );
}

class QuizAnswersRouteArgs {
  const QuizAnswersRouteArgs({required this.setId, this.key});

  final String setId;

  final Key? key;

  @override
  String toString() {
    return 'QuizAnswersRouteArgs{setId: $setId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizAnswersRouteArgs) return false;
    return setId == other.setId && key == other.key;
  }

  @override
  int get hashCode => setId.hashCode ^ key.hashCode;
}

/// generated route for
/// [QuizDashboardPage]
class QuizDashboardRoute extends PageRouteInfo<void> {
  const QuizDashboardRoute({List<PageRouteInfo>? children})
      : super(QuizDashboardRoute.name, initialChildren: children);

  static const String name = 'QuizDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizDashboardPage();
    },
  );
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    required ExamType examType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizRoute.name,
          args: QuizRouteArgs(examType: examType, key: key),
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteArgs>();
      return QuizPage(examType: args.examType, key: args.key);
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({required this.examType, this.key});

  final ExamType examType;

  final Key? key;

  @override
  String toString() {
    return 'QuizRouteArgs{examType: $examType, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizRouteArgs) return false;
    return examType == other.examType && key == other.key;
  }

  @override
  int get hashCode => examType.hashCode ^ key.hashCode;
}

/// generated route for
/// [QuizResultsPage]
class QuizResultsRoute extends PageRouteInfo<QuizResultsRouteArgs> {
  QuizResultsRoute({
    required String setId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizResultsRoute.name,
          args: QuizResultsRouteArgs(setId: setId, key: key),
          initialChildren: children,
        );

  static const String name = 'QuizResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizResultsRouteArgs>();
      return QuizResultsPage(setId: args.setId, key: args.key);
    },
  );
}

class QuizResultsRouteArgs {
  const QuizResultsRouteArgs({required this.setId, this.key});

  final String setId;

  final Key? key;

  @override
  String toString() {
    return 'QuizResultsRouteArgs{setId: $setId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuizResultsRouteArgs) return false;
    return setId == other.setId && key == other.key;
  }

  @override
  int get hashCode => setId.hashCode ^ key.hashCode;
}

/// generated route for
/// [QuizStatisticsPage]
class QuizStatisticsRoute extends PageRouteInfo<void> {
  const QuizStatisticsRoute({List<PageRouteInfo>? children})
      : super(QuizStatisticsRoute.name, initialChildren: children);

  static const String name = 'QuizStatisticsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizStatisticsPage();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [UserSettingsScreen]
class UserSettingsRoute extends PageRouteInfo<void> {
  const UserSettingsRoute({List<PageRouteInfo>? children})
      : super(UserSettingsRoute.name, initialChildren: children);

  static const String name = 'UserSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserSettingsScreen();
    },
  );
}
