import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:quiz_radioamatori/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/sign_in_apple/sign_in_apple_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/sign_in_google/sign_in_google_provider.dart';
import 'package:social_auth_buttons/social_auth_buttons.dart';

class SignInButtons extends ConsumerWidget {
  const SignInButtons({
    required this.onSignInComplete,
    super.key,
  });
  final VoidCallback onSignInComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Platform.isIOS) ...[
            AppleAuthButton(
              text: 'Accedi con Apple',
              onPressed: () async {
                try {
                  await ref.read(signInWithAppleProvider.future);
                  onSignInComplete();
                } on Exception catch (e) {
                  if (context.mounted) showErrorSnackbar(context, 'Errore durante il login');
                  log(e.toString());
                }
              },
            ),
            const Gap(10),
          ],
          GoogleAuthButton(
            text: 'Accedi con Google',
            onPressed: () async {
              try {
                await ref.read(signInWithGoogleProvider.future);
                onSignInComplete();
              } on Exception catch (e) {
                if (context.mounted) showErrorSnackbar(context, 'Errore durante il login');
                log(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
