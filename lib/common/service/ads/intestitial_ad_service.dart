import 'dart:async';
import 'dart:developer';

import 'package:app_template/config/app_configs.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdService {
  InterstitialAdService();
  InterstitialAd? _interstitialAd;

  Future<void> loadInterstitialAd() async {
    final completer = Completer<void>();

    await InterstitialAd.load(
      adUnitId: AppConfigs.interstitialAdUnitId(),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          log('$ad loaded.');
          _interstitialAd = ad;
          completer.complete();
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('InterstitialAd failed to load: $error');
          completer.completeError(error);
        },
      ),
    );

    return completer.future;
  }

  Future<void> showInterstitialAd() async {
    if (_interstitialAd != null) {
      log('showing interstitial ad');
      await _interstitialAd?.show();
      _interstitialAd = null;
    } else {
      log('Ad is not loaded yet.');
    }
  }

  Future<void> showDirectly() {
    return loadInterstitialAd().then((value) => showInterstitialAd());
  }
}
