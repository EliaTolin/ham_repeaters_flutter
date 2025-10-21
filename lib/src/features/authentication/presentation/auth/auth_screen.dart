import 'dart:developer';

import 'package:app_template/common/extension/hard_coded_string.dart';
import 'package:app_template/common/utils/deep_link_utils.dart';
import 'package:app_template/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:app_template/common/widgets/snackbars/show_success_snackbar.dart';
import 'package:app_template/resources/resources.dart';
import 'package:app_template/router/app_router.dart';
import 'package:app_template/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

@RoutePage()
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgImageAssets.barrel,
                    width: 150,
                    height: 150,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'App_template'.hardcoded,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Le tue Acetaie a portata di mano.'.hardcoded,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Gap(16),
                  // Card di autenticazione
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    shadowColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                        // Completamento del sign-in
                        onSignInComplete: (response) {
                          ref.invalidate(getUserIdProvider);
                          context.router.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (_) => false,
                          );
                        },

                        // Completamento della registrazione
                        onSignUpComplete: (response) {
                          ref.invalidate(getUserIdProvider);
                          context.router.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (_) => false,
                          );
                          showSuccessSnackbar(
                            context,
                            'Verifica la tua email per completare la registrazione, controlla la tua casella.'
                                .hardcoded,
                          );
                        },

                        // Gestione degli errori
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

                        // Campi per nome e cognome
                        metadataFields: [
                          MetaDataField(
                            label: 'Nome'.hardcoded,
                            key: 'name',
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return 'Il nome è obbligatorio'.hardcoded;
                              }
                              return null;
                            },
                          ),
                          MetaDataField(
                            label: 'Cognome'.hardcoded,
                            key: 'surname',
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
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
