import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/config/app_configs.dart';
import 'package:quiz_radioamatori/src/app.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // unawaited(MobileAds.instance.initialize());

  await Supabase.initialize(
    url: AppConfigs.getSupabaseUrl(),
    anonKey: AppConfigs.getSupabaseKey(),
  );

  runApp(const ProviderScope(child: QuizRadioamatori()));
}
