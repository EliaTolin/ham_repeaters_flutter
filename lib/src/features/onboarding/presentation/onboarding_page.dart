import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz_radioamatori/common/extension/hard_coded_string.dart';
import 'package:quiz_radioamatori/common/extension/l10n_extension.dart';
import 'package:quiz_radioamatori/common/widgets/ads/controller/auto_banner_controller.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/splashscreen/provider/set_onboarding_seen_provider.dart';

@RoutePage()
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final params = ConsentRequestParameters();
      ConsentInformation.instance.requestConsentInfoUpdate(params, () async {
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          await ConsentForm.loadAndShowConsentFormIfRequired((loadAndShowError) {
            if (loadAndShowError != null) {
              // opzionale: log error
            } else {
              ref.invalidate(autoBannerControllerProvider);
            }
          });
        }
      }, (FormError error) {
        // opzionale: log error
      });
    });

    return Scaffold(
      body: IntroductionScreen(
        autoScrollDuration: 9999999,
        pages: getListPages(context, ref),
        showSkipButton: true,
        skip: Text(
          context.localization.skip,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        next: const Icon(Icons.arrow_forward),
        done: Text(
          context.localization.done,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        onDone: () => onDone(context, ref),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(22, 10),
          activeColor: Theme.of(context).colorScheme.primary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  // --- UI helpers -----------------------------------------------------------

  Widget getTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget getBody(BuildContext context, String body) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        body,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  // Icon fallback (nessun asset richiesto)
  Widget buildIcon(IconData icon) {
    return Icon(icon, size: 150);
  }

  // Se preferisci usare i tuoi asset, tieni questo helper e scommenta dove indicato
  Widget buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(width: 350, child: Image.asset(path)),
    );
  }

  // --- Pagine onboarding -----------------------------------------------------

  List<PageViewModel> getListPages(BuildContext context, WidgetRef ref) {
    return [
      PageViewModel(
        // image: buildImage(ImageAssets.onboarding_welcome), // asset (opzionale)
        image: buildIcon(Icons.radio), // icona fallback
        titleWidget: getTitle(context, 'Benvenuto in Quiz Radioamatori'.hardcoded),
        bodyWidget: getBody(
          context,
          'Allena la teoria, memorizza le sigle e prepara la patente da radioamatore con quiz aggiornati.'
              .hardcoded,
        ),
      ),
      PageViewModel(
        // image: buildImage(ImageAssets.onboarding_topics),
        image: buildIcon(Icons.category),
        titleWidget: getTitle(context, 'Argomenti & Banche Dati'.hardcoded),
        bodyWidget: getBody(
          context,
          'Abbreviazioni, Alfabeto, Bande di frequenza, Normativa, Circuiti, Componenti e molto altro.'
              .hardcoded,
        ),
      ),
      PageViewModel(
        // image: buildImage(ImageAssets.onboarding_modes),
        image: buildIcon(Icons.playlist_add_check),
        titleWidget: getTitle(context, 'Modalità Esame'.hardcoded),
        bodyWidget: getBody(
          context,
          'Scegli tra PARZIALE (per topic specifici) o COMPLETO (simulazione d’esame).'.hardcoded,
        ),
      ),
      PageViewModel(
        // image: buildImage(ImageAssets.onboarding_practice),
        image: buildIcon(Icons.psychology),
        titleWidget: getTitle(context, 'Allenamento intelligente'.hardcoded),
        bodyWidget: getBody(
          context,
          'Ripetizioni mirate sugli errori, domande casuali, timer e sessioni salvate.'.hardcoded,
        ),
      ),
      PageViewModel(
        // image: buildImage(ImageAssets.onboarding_stats),
        image: buildIcon(Icons.insights),
        titleWidget: getTitle(context, 'Statistiche & Obiettivi'.hardcoded),
        bodyWidget: getBody(
          context,
          'Monitora i progressi per argomento, scopri i punti deboli e punta al 100% con sessioni dedicate.'
              .hardcoded,
        ),
      ),
      PageViewModel(
        titleWidget: getTitle(context, 'Iniziamo!'.hardcoded),
        image: Icon(Icons.check_circle, size: 150, color: Theme.of(context).colorScheme.primary),
        bodyWidget: getBody(
          context,
          'Accedi o registrati per iniziare subito il tuo percorso verso la patente.'.hardcoded,
        ),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  onPressed: () => onDone(context, ref),
                  child: Text('Vai alla app'.hardcoded),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  // --- Done handler ----------------------------------------------------------

  Future<void> onDone(BuildContext context, WidgetRef ref) async {
    await ref.read(setOnboardingSeenProvider.future);
    if (context.mounted) {
      await context.router.replace(const AuthRoute());
    }
  }

  // (Invariato) dialog opzionale per tracking
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
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
