import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz_radioamatori/common/extension/hard_coded_string.dart';
import 'package:quiz_radioamatori/common/extension/l10n_extension.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/set_onboarding_seen_provider.dart';

@RoutePage()
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: IntroductionScreen(
                      globalBackgroundColor: Colors.transparent,
                      pages: _pages(context),
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
                      onDone: () => _onDone(context, ref),
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

  List<PageViewModel> _pages(BuildContext context) {
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
      PageViewModel(
        title: 'Pronti a iniziare?'.hardcoded,
        body: 'Crea un profilo o accedi e comincia subito il percorso verso la patente.'.hardcoded,
        image: _iconBadgeColored(context, Icons.check_circle),
        decoration: deco(),
        footer: _primaryCta(context),
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

  Widget _iconBadgeColored(BuildContext context, IconData icon) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.primary.withValues(alpha: .18),
            color.secondary.withValues(alpha: .14),
          ],
        ),
      ),
      child: Center(
        child: Icon(icon, size: 84, color: color.onPrimaryContainer),
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

  Widget _primaryCta(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: SizedBox(
        width: w * .65,
        child: FilledButton.tonal(
          onPressed: () => _onDone(context, null),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text('Vai all’app'.hardcoded),
          ),
        ),
      ),
    );
  }

  // — Done handler ——————————————————————————————————————————

  Future<void> _onDone(BuildContext context, WidgetRef? ref) async {
    if (ref != null) {
      await ref.read(setOnboardingSeenProvider.future);
    }
    if (context.mounted) {
      await context.router.replace(const AuthRoute());
    }
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
