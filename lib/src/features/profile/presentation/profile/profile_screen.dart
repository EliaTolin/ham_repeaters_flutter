import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/clients/package_info/package_info.dart';
import 'package:quiz_radioamatori/common/extension/hard_coded_string.dart';
import 'package:quiz_radioamatori/common/widgets/profile_avatar.dart';
import 'package:quiz_radioamatori/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/profile/presentation/profile/controller/profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Profilo'.hardcoded)),
      body: ref
          .watch(profileControllerProvider)
          .when(
            data: (state) {
              final profile = state.profile;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileAvatar(imageProfileUrl: state.imageProfileUrl, size: 200),
                    const Gap(20),
                    Text(
                      '${profile.name} ${profile.surname}',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(10),
                    Text(
                      state.email,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(30),

                    // Impostazioni
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: const Icon(Icons.settings, color: Colors.blueAccent),
                        title: Text(
                          'Impostazioni'.hardcoded,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          context.router.push(const UserSettingsRoute());
                        },
                      ),
                    ),
                    const Gap(10),

                    // Logout
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.redAccent),
                        title: Text(
                          'Logout'.hardcoded,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () async {
                          await ref.read(profileControllerProvider.notifier).logout();
                          if (context.mounted) {
                            await context.router.replace(const AuthRoute());
                          }
                        },
                      ),
                    ),
                    const Gap(10),
                    // Contattaci
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: const Icon(Icons.email, color: Colors.greenAccent),
                        title: Text(
                          'Contattaci'.hardcoded,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () async {
                          final emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'info@auroradigital.it',
                            queryParameters: {'subject': 'QuizRadioamatori-Supporto'},
                          );
                          if (await canLaunchUrl(emailLaunchUri)) {
                            await launchUrl(emailLaunchUri);
                          } else {
                            if (context.mounted) {
                              showErrorSnackbar(
                                context,
                                "Errore durante l'apertura della mail".hardcoded,
                              );
                            }
                          }
                        },
                      ),
                    ),

                    const Gap(30),

                    // Versione dell'app
                    ref
                        .watch(packageInfoProvider)
                        .when(
                          data: (packageInfo) => Text(
                            'Versione: ${packageInfo.version}+${packageInfo.buildNumber}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                          ),
                          loading: () => const SizedBox.shrink(),
                          error: (error, _) => Text('Errore: $error'.hardcoded),
                        ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Errore: $error'.hardcoded)),
          ),
    );
  }
}
