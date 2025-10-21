import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_radioamatori/clients/supabase/supabase_client.dart';
import 'package:quiz_radioamatori/src/features/authentication/data/datasource/auth_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

part 'auth_supabase_datasource.g.dart';

class AuthSupabaseDatasource implements AuthDatasource {
  AuthSupabaseDatasource(this.supabaseClient);
  final SupabaseClient supabaseClient;
  @override
  Future<void> changePassword(String password) async {
    await supabaseClient.auth.updateUser(UserAttributes(password: password));
  }

  @override
  Future<void> deleteAccount() async {
    final userId = supabaseClient.auth.currentUser?.id;
    if (userId == null) {
      throw Exception();
    }
    await supabaseClient
        .from('profiles')
        .update({'deleted_at': DateTime.now().toIso8601String()}).eq('id', userId);
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

  @override
  Future<bool> signInGoogle() async {
    const webClientId = '472936462959-jrs1i8dasb3s8g8mus3lb4c96mhjmvjr.apps.googleusercontent.com';
    const iosClientId = '472936462959-irnu8mbsipg1pe1r4v5t0f8iq4i3ev21.apps.googleusercontent.com';

    final googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google Sign-In canceled by user.');
    }

    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw Exception('Authentication failed: Missing token.');
    }

    try {
      // Sign in or create account using Supabase
      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user == null) {
        throw Exception('Failed to sign in with Google.');
      }

      log('User signed in successfully: ${response.user}');
      return true;
    } catch (e) {
      log('Error during Google Sign-In: $e');
      return false;
    }
  }

  @override
  Future<bool> signWithApple() async {
    final rawNonce = supabaseClient.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException('Could not find ID Token from generated credential.');
    }

    final result = await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );

    if (credential.familyName != null && credential.givenName != null) {
      await supabaseClient.from('profiles').upsert({
        'id': result.user?.id,
        'name': credential.givenName,
        'surname': credential.familyName,
      });
    }

    return true;
  }
}

@riverpod
Future<AuthSupabaseDatasource> authSupabaseDatasource(Ref ref) async {
  final supabaseClient = ref.read(supabaseClientProvider);
  return AuthSupabaseDatasource(supabaseClient);
}
