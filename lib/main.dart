import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/config/app_configs.dart';
import 'package:quiz_radioamatori/src/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

void main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConfigs.getSupabaseUrl(),
    anonKey: AppConfigs.getSupabaseKey(),
  );

  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://6face62446edd512d2ac93457b9df9b5@o4508342166224896.ingest.de.sentry.io/4510252171001936'
        ..sendDefaultPii = true
        ..enableLogs = true
        ..tracesSampleRate = 1.0
        ..profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: const ProviderScope(
          child: QuizRadioamatori(),
        ),
      ),
    ),
  );
}
