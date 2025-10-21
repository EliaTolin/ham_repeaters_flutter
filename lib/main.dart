import 'package:app_template/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // unawaited(MobileAds.instance.initialize());

  // await Supabase.initialize(
  //   url: AppConfigs.getSupabaseUrl(),
  //   anonKey: AppConfigs.getSupabaseKey(),
  // );

  runApp(
    const ProviderScope(
      child: App_template(),
    ),
  );
}
