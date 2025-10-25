import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/config/app_configs.dart';
import 'package:quiz_radioamatori/src/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConfigs.getSupabaseUrl(),
    anonKey: AppConfigs.getSupabaseKey(),
  );

  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://6face62446edd512d2ac93457b9df9b5@o4508342166224896.ingest.de.sentry.io/4510252171001936'
        // Adds request headers and IP for users, for more info visit:
        // https://docs.sentry.io/platforms/dart/guides/flutter/data-management/data-collected/
        ..sendDefaultPii = true
        ..enableLogs = true
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        ..tracesSampleRate = 1.0
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        ..profilesSampleRate = 1.0;
      // Configure Session Replay
      options.replay.sessionSampleRate = 0.1;
      options.replay.onErrorSampleRate = 1.0;
    },
    appRunner: () => runApp(SentryWidget(child: const ProviderScope(child: QuizRadioamatori()))),
  );
}
