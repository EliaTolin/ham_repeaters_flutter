import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/l10n/app_localizations.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/themes/light_themes.dart';

class QuizRadioamatori extends ConsumerWidget {
  const QuizRadioamatori({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(
        deepLinkTransformer: (uri) {
          log('uri: $uri');
          return SynchronousFuture(uri.replace(path: uri.path.replaceFirst('/app-deeplink', '')));
        },
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'QuizRadioamatori',
      theme: lightTheme,
    );
  }
}
