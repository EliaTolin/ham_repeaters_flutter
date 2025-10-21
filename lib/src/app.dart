import 'dart:developer';

import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/router/app_router.dart';
import 'package:app_template/themes/light_themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App_template extends ConsumerWidget {
  const App_template({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(
        deepLinkTransformer: (uri) {
          log('uri: $uri');
          return SynchronousFuture(
            uri.replace(path: uri.path.replaceFirst('/app-deeplink', '')),
          );
        },
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'App_template',
      theme: lightTheme,
    );
  }
}
