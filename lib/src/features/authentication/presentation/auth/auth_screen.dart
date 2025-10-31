import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:quiz_radioamatori/common/extension/hard_coded_string.dart';
import 'package:quiz_radioamatori/common/utils/deep_link_utils.dart';
import 'package:quiz_radioamatori/common/widgets/logo_icon.dart';
import 'package:quiz_radioamatori/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:quiz_radioamatori/common/widgets/snackbars/show_success_snackbar.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/widgets/sign_in_buttons.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/set_onboarding_seen/set_onboarding_seen_provider.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

@RoutePage()
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        FocusManager.instance.primaryFocus?.unfocus();
      });
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              spacing: 8,
              children: [
                // Logo e Titolo - migliorato
                const LogoIcon(size: 100),
                const Gap(16),
                Text(
                  'Quiz Radioamatori'.hardcoded,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                ),
                const Gap(8),
                Text(
                  'Allenati e preparati! 73!'.hardcoded,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                        fontSize: 18,
                      ),
                ),
                const Gap(32),
                // Sezione Social Login
                SignInButtons(
                  onSignInComplete: () {
                    ref
                      ..invalidate(getUserIdProvider)
                      ..read(setOnboardingSeenProvider.future);
                    context.router.pushAndPopUntil(
                      const HomeRoute(),
                      predicate: (_) => false,
                    );
                  },
                ),
                const Gap(24),
                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Oppure'.hardcoded,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                // Form di autenticazione email/password
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  shadowColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SupaEmailAuth(
                      localization: SupaEmailAuthLocalization(
                        enterEmail: "Inserisci l'email".hardcoded,
                        enterPassword: 'Inserisci la password'.hardcoded,
                        forgotPassword: 'Password dimenticata?'.hardcoded,
                        signIn: 'Accedi'.hardcoded,
                        signUp: 'Registrati'.hardcoded,
                        passwordLengthError: 'La password deve essere più lunga'.hardcoded,
                        dontHaveAccount: 'Non hai un account? Registrati'.hardcoded,
                        haveAccount: 'Hai già un account? Accedi'.hardcoded,
                        backToSignIn: "Torna all'accesso".hardcoded,
                        unexpectedError: 'Errore inaspettato'.hardcoded,
                        validEmailError: "Inserisci un'email valida".hardcoded,
                        sendPasswordReset: 'Invia reset password'.hardcoded,
                        passwordResetSent: 'Reset password inviato'.hardcoded,
                      ),
                      redirectTo: DeepLinkUtils.buildDeepLink('login-callback'),
                      resetPasswordRedirectTo: DeepLinkUtils.buildDeepLink('change-password'),
                      onSignInComplete: (response) async {
                        await ref.read(setOnboardingSeenProvider.future);
                        ref.invalidate(getUserIdProvider);
                        if (context.mounted) {
                          await context.router.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (_) => false,
                          );
                        }
                      },
                      onSignUpComplete: (response) async {
                        ref.invalidate(getUserIdProvider);
                        if (context.mounted) {
                          showSuccessSnackbar(
                            context,
                            'Verifica la tua email per completare la registrazione, controlla la tua casella.'
                                .hardcoded,
                          );
                        }
                      },
                      onError: (error) {
                        log('onError: $error');
                        if (error is AuthException && error.statusCode == '400') {
                          switch (error.code) {
                            case 'invalid_credentials':
                              showErrorSnackbar(context, 'Email o password errati'.hardcoded);
                            case 'email_not_confirmed':
                              showErrorSnackbar(
                                context,
                                'Verifica la tua email per accedere'.hardcoded,
                              );
                            default:
                              showErrorSnackbar(context, 'Errore inaspettato'.hardcoded);
                          }
                          return;
                        }
                        showErrorSnackbar(context, 'Errore inaspettato'.hardcoded);
                      },
                      metadataFields: [
                        MetaDataField(
                          label: 'Nome'.hardcoded,
                          key: 'first_name',
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return 'Il nome è obbligatorio'.hardcoded;
                            }
                            return null;
                          },
                        ),
                        MetaDataField(
                          label: 'Cognome'.hardcoded,
                          key: 'last_name',
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return 'Il cognome è obbligatorio'.hardcoded;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
