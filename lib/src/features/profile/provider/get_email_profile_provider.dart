import 'package:app_template/clients/supabase/supabase_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_email_profile_provider.g.dart';

@riverpod
Future<String> getEmailProfile(Ref ref) async {
  final supabase = ref.watch(supabaseClientProvider);
  final email = supabase.auth.currentUser!.email;
  return email!;
}
