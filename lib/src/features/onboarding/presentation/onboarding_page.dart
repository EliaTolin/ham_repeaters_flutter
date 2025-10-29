import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz_radioamatori/common/extension/hard_coded_string.dart';
import 'package:quiz_radioamatori/common/extension/l10n_extension.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/show_signup_dialog.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/widgets/sign_in_buttons.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/get_user_id_provider.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/set_onboarding_seen_provider.dart';

@RoutePage()
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFinalLayout = useState(false);
    // // — Consenso ADS (come tuo) —
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final params = ConsentRequestParameters();
    //   ConsentInformation.instance.requestConsentInfoUpdate(params, () async {
    //     if (await ConsentInformation.instance.isConsentFormAvailable()) {
    //       await ConsentForm.loadAndShowConsentFormIfRequired((loadAndShowError) {
    //         if (loadAndShowError == null) {
    //           ref.invalidate(autoBannerControllerProvider);
    //         }
    //       });
    //     }
    //   }, (FormError error) {});
    // });

    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // — Sfondo con gradient “radio” + pattern leggero —
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.primary.withValues(alpha: .12),
                  color.secondary.withValues(alpha: .08),
                  theme.scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
          // — Contenuto —
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(alpha: .75),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: color.primary.withValues(alpha: .12),
                      ),
                    ),
                    child: showFinalLayout.value
                        ? _buildFinalLayout(context, ref)
                        : IntroductionScreen(
                            globalBackgroundColor: Colors.transparent,
                            pages: _pages(context, ref),
                            // — Controlli —
                            showSkipButton: true,
                            skip: Text(
                              context.localization.skip,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: color.secondary,
                                letterSpacing: .2,
                              ),
                            ),
                            next: _roundIcon(context, Icons.arrow_forward),
                            done: Text(
                              context.localization.done,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: color.primary,
                                letterSpacing: .2,
                              ),
                            ),
                            onDone: () {
                              showFinalLayout.value = true;
                            },
                            onSkip: () {
                              showFinalLayout.value = true;
                            },
                            dotsDecorator: DotsDecorator(
                              size: const Size.square(8),
                              activeSize: const Size(16, 8),
                              spacing: const EdgeInsets.symmetric(horizontal: 4),
                              color: theme.colorScheme.onSurface.withValues(alpha: .20),
                              activeColor: color.primary,
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            curve: Curves.easeOutCubic,
                            onChange: (index) {
                              final pages = _pages(context, ref);
                              if (index == pages.length) {
                                showFinalLayout.value = true;
                              }
                            },
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // — Pagine ——————————————————————————————————————————————

  List<PageViewModel> _pages(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    PageDecoration deco({double space = 16}) => PageDecoration(
          titleTextStyle: theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w800,
            color: color.primary,
            letterSpacing: .2,
          ),
          bodyTextStyle: theme.textTheme.titleMedium!.copyWith(
            height: 1.35,
          ),
          imagePadding: const EdgeInsets.only(top: 8, bottom: 8),
          contentMargin: const EdgeInsets.symmetric(horizontal: 20),
          footerPadding: const EdgeInsets.only(top: 8),
          bodyAlignment: Alignment.center,
          imageAlignment: Alignment.center,
          pageColor: Colors.transparent,
        );

    return [
      PageViewModel(
        title: 'Benvenuto in Quiz Radioamatori'.hardcoded,
        body:
            'Allena la teoria, memorizza sigle e normative e prepara la patente da radioamatore con quiz aggiornati.'
                .hardcoded,
        image: _iconBadge(context, Icons.radio),
        decoration: deco(),
        footer: _featureChips(
          context,
          const [
            'Banche dati aggiornate',
            'Domande verificate',
            'Allenamento smart',
          ],
        ),
      ),
      PageViewModel(
        title: 'Argomenti & Banche Dati'.hardcoded,
        body:
            'Abbreviazioni, Alfabeto, Bande di frequenza, Normativa, Circuiti, Codice_Q e molto altro.'
                .hardcoded,
        image: _iconBadge(context, Icons.category),
        decoration: deco(),
        footer: _featureChips(context, const [
          'Alfabeto NATO',
          'Codice_Q',
          'Normative',
        ]),
      ),
      PageViewModel(
        title: 'Modalità Esame'.hardcoded,
        body: 'Per prepararti al meglio scegli tra \n• Esonero PARZIALE  \n• Esame COMPLETO'
            .hardcoded,
        image: _iconBadge(context, Icons.playlist_add_check),
        decoration: deco(),
        footer: _modeBadges(context),
      ),
      PageViewModel(
        title: 'Allenamento intelligente'.hardcoded,
        body: 'Verifica gli errori, domande casuali, timer, e molto altro.'.hardcoded,
        image: _iconBadge(context, Icons.psychology),
        decoration: deco(),
        footer: _featureChips(context, const [
          'Errori ricorrenti',
          'Timer',
          'Domande casuali',
        ]),
      ),
      PageViewModel(
        title: 'Statistiche & Obiettivi'.hardcoded,
        body:
            'Monitora i progressi per argomento, individua i punti deboli e punta al 100% con sessioni dedicate.'
                .hardcoded,
        image: _iconBadge(context, Icons.insights),
        decoration: deco(),
        footer: _miniStats(context),
      ),
    ];
  }

  // — Helpers UI ———————————————————————————————————————————

  Widget _roundIcon(BuildContext context, IconData icon) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.primary.withValues(alpha: .3)),
      ),
      child: Icon(icon),
    );
  }

  Widget _iconBadge(BuildContext context, IconData icon) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.primary.withValues(alpha: .12),
            color.primary.withValues(alpha: .04),
            Colors.transparent,
          ],
          radius: .9,
        ),
        border: Border.all(color: color.primary.withValues(alpha: .18)),
      ),
      child: Center(
        child: Icon(icon, size: 72, color: color.primary),
      ),
    );
  }

  Widget _featureChips(BuildContext context, List<String> items) {
    final color = Theme.of(context).colorScheme;
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: items
          .map(
            (t) => Chip(
              label: Text(t),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: -2),
              side: BorderSide(color: color.primary.withValues(alpha: .25)),
              backgroundColor: color.primary.withValues(alpha: .08),
            ),
          )
          .toList(),
    );
  }

  Widget _modeBadges(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _modeCard(
            context,
            title: 'Parziale'.hardcoded,
            subtitle: 'Esonero'.hardcoded,
            icon: Icons.tips_and_updates,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _modeCard(
            context,
            title: 'Completo'.hardcoded,
            subtitle: "Tutto il programma d'esame".hardcoded,
            icon: Icons.task_alt,
            highlight: true,
          ),
        ),
      ],
    );
  }

  Widget _modeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    bool highlight = false,
  }) {
    final color = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: highlight
            ? color.primary.withValues(alpha: .10)
            : Theme.of(context).colorScheme.surface.withValues(alpha: .6),
        border: Border.all(
          color: highlight ? color.primary : color.primary.withValues(alpha: .2),
          width: 1.4,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: highlight ? color.primary : color.onSurface),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .7),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniStats(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final on = Theme.of(context).colorScheme.onSurface.withValues(alpha: .75);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _statTile('Media'.hardcoded, '82%'.hardcoded, text, on),
        const SizedBox(width: 14),
        _statTile('Tempo'.hardcoded, '12h'.hardcoded, text, on),
        const SizedBox(width: 14),
        _statTile('Argomenti'.hardcoded, '24'.hardcoded, text, on),
      ],
    );
  }

  Widget _statTile(String label, String value, TextTheme text, Color on) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: text.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
        Text(label, style: text.labelLarge?.copyWith(color: on)),
      ],
    );
  }

  Widget _buildFinalLayout(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final w = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Titolo
            Text(
              'Pronti a iniziare?'.hardcoded,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: color.primary,
                letterSpacing: .2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            Text(
              'Registrati per salvare i tuoi progressi e accedere a tutte le funzionalità.'
                  .hardcoded,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.35,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            // Sezione benefici
            Container(
              margin: EdgeInsets.symmetric(horizontal: w * 0.05),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: color.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.rocket_launch,
                        color: color.primary,
                        size: 24,
                      ),
                      const Gap(10),
                      Text(
                        'Cosa otterrai:',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: color.primary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  _buildOnboardingBenefitItem(
                    context,
                    Icons.track_changes,
                    'Statistiche dettagliate',
                    'Monitora i tuoi progressi e migliora',
                  ),
                  const Gap(12),
                  _buildOnboardingBenefitItem(
                    context,
                    Icons.settings_backup_restore,
                    'Sincronizzazione',
                    'Accedi da qualsiasi dispositivo',
                  ),
                  const Gap(12),
                  _buildOnboardingBenefitItem(
                    context,
                    Icons.share,
                    'Condividi i risultati',
                    'Condividi i tuoi successi',
                  ),
                ],
              ),
            ),
            const Gap(20),
            // Sign In Buttons
            SignInButtons(
              onSignInComplete: () => _onSignInComplete(context, ref),
            ),
            const Gap(20),
            // Divider
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: color.onSurface.withValues(alpha: 0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Oppure'.hardcoded,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: color.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: color.onSurface.withValues(alpha: 0.2),
                  ),
                ),
              ],
            ),
            const Gap(12),
            // Bottone per aprire dialog email
            SizedBox(
              width: w * 0.75,
              child: OutlinedButton.icon(
                onPressed: () => _openEmailSignUpDialog(context, ref),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(
                    color: color.primary.withValues(alpha: 0.6),
                  ),
                ),
                icon: Icon(Icons.email, color: color.primary),
                label: Text(
                  'Registrati con Email'.hardcoded,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: color.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Gap(16),
            // Continua come ospite - piccolo in basso
            TextButton(
              onPressed: () => _onContinueAsGuest(context, ref),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Continua come ospite'.hardcoded,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color.onSurface.withValues(alpha: 0.6),
                  decoration: TextDecoration.underline,
                  decorationColor: color.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // — Helpers per benefici —————————————————————————————————————————

  Widget _buildOnboardingBenefitItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: color.primary,
            size: 20,
          ),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.onSurface,
                ),
              ),
              const Gap(2),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // — Handlers ——————————————————————————————————————————————

  Future<void> _onSignInComplete(BuildContext context, WidgetRef ref) async {
    await ref.read(setOnboardingSeenProvider.future);
    ref.invalidate(getUserIdProvider);
    if (context.mounted) {
      await context.router.replace(const HomeRoute());
    }
  }

  Future<void> _openEmailSignUpDialog(BuildContext context, WidgetRef ref) async {
    if (context.mounted) {
      await showSignUpDialog(
        context,
        onContinueAsGuest: () => _continueAsGuest(context, ref),
      );
    }
  }

  Future<void> _continueAsGuest(BuildContext context, WidgetRef? ref) async {
    try {
      // Segna onboarding come visto
      if (ref != null) {
        await ref.read(setOnboardingSeenProvider.future);
      }
      // Fai sign in anonimo
      if (ref != null) {
        await ref.read(anonymousSignInProvider.future);
        ref.invalidate(getUserIdProvider);
      }
      // Vai alla home
      if (context.mounted) {
        await context.router.replace(const HomeRoute());
      }
    } catch (e) {
      // Se fallisce, vai comunque alla home
      if (context.mounted) {
        await context.router.replace(const HomeRoute());
      }
    }
  }

  Future<void> _onContinueAsGuest(BuildContext context, WidgetRef? ref) async {
    await _continueAsGuest(context, ref);
  }

  // — Dialog tracking opzionale (invariato) —
  Future<void> showCustomTrackingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: Text(context.localization.tracking_permission_title),
          content: Text(context.localization.tracking_permission_message),
          actions: <Widget>[
            TextButton(
              child: Text(context.localization.tracking_permission_next),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
