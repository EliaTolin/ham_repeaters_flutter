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
import 'package:quiz_radioamatori/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/set_onboarding_seen/set_onboarding_seen_provider.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

Future<void> showSignUpDialog(
  BuildContext context, {
  VoidCallback? onContinueAsGuest,
}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.7),
    builder: (BuildContext dialogContext) {
      return Consumer(
        builder: (BuildContext dialogBuildContext, WidgetRef ref, Widget? child) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            insetPadding: const EdgeInsets.symmetric(horizontal: 8),
            backgroundColor: Colors.transparent,
            child: Container(
              width: MediaQuery.of(dialogBuildContext).size.width,
              height: MediaQuery.of(dialogBuildContext).size.height,
              decoration: BoxDecoration(
                color: Theme.of(dialogBuildContext).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: Column(
                      spacing: 8,
                      children: [
                        // Header con close button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 40),
                            const Expanded(
                              child: Center(
                                child: LogoIcon(size: 80),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.of(dialogContext).pop(),
                              color: Theme.of(dialogBuildContext).colorScheme.onSurface,
                            ),
                          ],
                        ),

                        // Titolo persuasivo
                        Text(
                          'Unisciti a Quiz Radioamatori',
                          style: Theme.of(dialogBuildContext).textTheme.headlineLarge?.copyWith(
                                color: Theme.of(dialogBuildContext).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Accedi per sbloccare tutte le funzionalità!'.hardcoded,
                          style: Theme.of(dialogBuildContext).textTheme.titleMedium?.copyWith(
                                color: Theme.of(dialogBuildContext)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.7),
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(16),
                        // Sezione Social Login
                        SignInButtons(
                          onSignInComplete: () async {
                            ref
                              ..invalidate(getUserIdProvider)
                              ..invalidate(isAnonymousProvider);
                            await ref.read(setOnboardingSeenProvider.future);
                            if (dialogContext.mounted) {
                              Navigator.of(dialogContext).pop();
                              if (context.mounted) {
                                await context.router.pushAndPopUntil(
                                  const HomeRoute(),
                                  predicate: (_) => false,
                                );
                              }
                            }
                          },
                        ),
                        const Gap(16),
                        // Sezione benefici - più persuasiva
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(dialogBuildContext)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Theme.of(dialogBuildContext)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.rocket_launch,
                                    color: Theme.of(dialogBuildContext).colorScheme.primary,
                                    size: 28,
                                  ),
                                  const Gap(12),
                                  Text(
                                    'Cosa otterrai:',
                                    style: Theme.of(dialogBuildContext)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(dialogBuildContext).colorScheme.primary,
                                        ),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              _buildBenefitItem(
                                context,
                                Icons.track_changes,
                                'Statistiche dettagliate',
                                'Monitora i tuoi progressi e migliora',
                              ),
                              const Gap(16),
                              _buildBenefitItem(
                                context,
                                Icons.gamepad,
                                'Diverse modalità di quiz',
                                'Allenati in modalità maratona, topics e altro.',
                              ),
                              const Gap(16),
                              _buildBenefitItem(
                                context,
                                Icons.settings_backup_restore,
                                'Sincronizzazione',
                                'Accedi da qualsiasi dispositivo',
                              ),
                            ],
                          ),
                        ),
                        // Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(dialogBuildContext)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'Oppure accedi con email'.hardcoded,
                                style: Theme.of(dialogBuildContext).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(dialogBuildContext)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(dialogBuildContext)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.2),
                              ),
                            ),
                          ],
                        ),
                        // Form di autenticazione email/password
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 6,
                          shadowColor: Theme.of(dialogBuildContext)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SupaEmailAuth(
                              autofocus: false,
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
                              resetPasswordRedirectTo:
                                  DeepLinkUtils.buildDeepLink('change-password'),
                              onSignInComplete: (response) async {
                                await ref.read(setOnboardingSeenProvider.future);
                                ref.invalidate(getUserIdProvider);
                                if (dialogContext.mounted) {
                                  Navigator.of(dialogContext).pop();
                                  if (context.mounted) {
                                    await context.router.pushAndPopUntil(
                                      const HomeRoute(),
                                      predicate: (_) => false,
                                    );
                                  }
                                }
                              },
                              onSignUpComplete: (response) async {
                                ref.invalidate(getUserIdProvider);
                                if (dialogContext.mounted) {
                                  Navigator.of(dialogContext).pop();
                                  if (context.mounted) {
                                    showSuccessSnackbar(
                                      context,
                                      'Verifica la tua email per completare la registrazione, controlla la tua casella.'
                                          .hardcoded,
                                    );
                                  }
                                }
                              },
                              onError: (error) {
                                log('onError: $error');
                                if (error is AuthException && error.statusCode == '400') {
                                  switch (error.code) {
                                    case 'invalid_credentials':
                                      showErrorSnackbar(
                                        dialogBuildContext,
                                        'Email o password errati'.hardcoded,
                                      );
                                    case 'email_not_confirmed':
                                      showErrorSnackbar(
                                        dialogBuildContext,
                                        'Verifica la tua email per accedere'.hardcoded,
                                      );
                                    default:
                                      showErrorSnackbar(
                                        dialogBuildContext,
                                        'Errore inaspettato'.hardcoded,
                                      );
                                  }
                                  return;
                                }
                                showErrorSnackbar(
                                  dialogBuildContext,
                                  'Errore inaspettato'.hardcoded,
                                );
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
                        // Bottone "Continua come ospite"
                        if (onContinueAsGuest != null) ...[
                          TextButton(
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              onContinueAsGuest();
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              'Continua come ospite'.hardcoded,
                              style: Theme.of(dialogBuildContext).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(dialogBuildContext)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                            ),
                          ),
                        ],
                        const Gap(16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildBenefitItem(
  BuildContext context,
  IconData icon,
  String title,
  String description,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
      ),
      const Gap(16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const Gap(4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}
