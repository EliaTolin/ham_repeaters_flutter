import 'dart:developer';

import 'package:app_template/clients/supabase/supabase_client.dart';
import 'package:app_template/src/features/authentication/data/datasource/auth_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

part 'auth_supabase_datasource.g.dart';

class AuthSupabaseDatasource implements AuthDatasource {
  AuthSupabaseDatasource(this.supabaseClient);
  final SupabaseClient supabaseClient;
  @override
  Future<void> changePassword(String password) async {
    await supabaseClient.auth.updateUser(
      UserAttributes(password: password),
    );
  }

  @override
  Future<void> deleteAccount() async {
    final userId = supabaseClient.auth.currentUser?.id;
    if (userId == null) {
      throw Exception();
    }
    await supabaseClient.from('profiles').update(
      {'deleted_at': DateTime.now().toIso8601String()},
    ).eq(
      'id',
      userId,
    );
    return;
  }

  @override
  String? getUserId() {
    return supabaseClient.auth.currentUser?.id;
  }

  @override
  Future<String?> getUserIdFromEmail(String email) async {
    try {
      final data = await supabaseClient.rpc('get_user_id_by_email', params: {'email': email});

      if (data is List) {
        final parsedData = data.map((e) => Map<String, String>.from(e as Map)).toList();

        return parsedData[0]['id'];
      } else {
        throw Exception('Invalid data format');
      }
    } on Exception catch (e) {
      log('get_user_id_by_email error: $e');
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }
}

@riverpod
Future<AuthSupabaseDatasource> authSupabaseDatasource(Ref ref) async {
  final supabaseClient = ref.read(supabaseClientProvider);
  return AuthSupabaseDatasource(supabaseClient);
}
