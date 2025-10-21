import 'package:app_template/common/extension/hard_coded_string.dart';
import 'package:app_template/common/extension/l10n_extension.dart';
import 'package:app_template/common/widgets/ads/controller/auto_banner_controller.dart';
import 'package:app_template/common/widgets/button/icon_button/share_iconbutton.dart';
import 'package:app_template/resources/resources.dart';
import 'package:app_template/router/app_router.dart';
import 'package:app_template/src/features/splashscreen/provider/set_onboarding_seen_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final params = ConsentRequestParameters();
      ConsentInformation.instance.requestConsentInfoUpdate(
        params,
        () async {
          if (await ConsentInformation.instance.isConsentFormAvailable()) {
            await ConsentForm.loadAndShowConsentFormIfRequired((loadAndShowError) {
              if (loadAndShowError != null) {
              } else {
                ref.invalidate(autoBannerControllerProvider);
              }
            });
          }
        },
        (FormError error) {},
      );
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
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

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
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<PageViewModel> getListPages(BuildContext context, WidgetRef ref) {
    return [
      PageViewModel(
        image: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: SvgPicture.asset(SvgImageAssets.barrel),
        ),
        titleWidget: getTitle(context, 'Benvenuto in App_template'.hardcoded),
        bodyWidget: getBody(context, 'Tradizione, Innovazione, Aceto Balsamico.'.hardcoded),
      ),
      PageViewModel(
        titleWidget: getTitle(context, 'Gestisci le tue Acetaie'.hardcoded),
        bodyWidget: getBody(
          context,
          'Con App_template potrai inserire le tue Acetaie e tenere traccia delle misurazioni.'
              .hardcoded,
        ),
        image: buildImage(ImageAssets.app_template),
      ),
      PageViewModel(
        titleWidget: getTitle(context, 'Gestisci Batterie e Botti'.hardcoded),
        bodyWidget: getBody(
          context,
          'Organizza e gestisci le tue batterie e botti di Aceto Balsamico in modo semplice.'
              .hardcoded,
        ),
        image: buildImage(ImageAssets.battery),
      ),
      PageViewModel(
        titleWidget: getTitle(context, 'Misura e Monitora'.hardcoded),
        bodyWidget: getBody(
          context,
          'Misura e tieni traccia dei parametri delle tue batterie e botti di Aceto Balsamico.'
              .hardcoded,
        ),
        image: buildImage(ImageAssets.misurations),
      ),
      PageViewModel(
        titleWidget: getTitle(context, 'Condividi la tua App_template'.hardcoded),
        bodyWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getBody(
              context,
              'Condividi la tua app_template con altri utenti per una gestione collaborativa.'
                  .hardcoded,
            ),
            ShareIconButton(onPressed: () {}),
          ],
        ),
        image: buildImage(ImageAssets.share),
      ),
      PageViewModel(
        titleWidget: getTitle(context, 'Inizia'),
        image: Icon(Icons.check_circle, size: 150, color: Theme.of(context).colorScheme.primary),
        bodyWidget: getBody(
          context,
          'Per iniziare a gestire la tua App_template, registrati ora!'.hardcoded,
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
                    backgroundColor: WidgetStateProperty.all(
                      Colors.green,
                    ),
                  ),
                  onPressed: () => onDone(context, ref),
                  child: Text('Iniziamo!'.hardcoded),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 350,
        child: Image.asset(path),
      ),
    );
  }

  Future<void> onDone(BuildContext context, WidgetRef ref) async {
    // Navigazione alla pagina principale o HomePage
    await ref.read(setOnboardingSeenProvider.future);
    if (context.mounted) {
      await context.router.replace(const AuthRoute());
    }
  }

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
