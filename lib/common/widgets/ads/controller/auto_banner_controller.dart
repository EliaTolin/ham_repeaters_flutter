import 'package:app_template/config/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_banner_controller.g.dart';

@riverpod
class AutoBannerController extends _$AutoBannerController {
  @override
  FutureOr<BannerAd?> build(AdSize adSize, Key keyUnique) async {
    final adUnitId = AppConfigs.bannerAdUnitId();
    final banner = BannerAd(
      adUnitId: adUnitId,
      size: adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    await banner.load();
    return banner;
  }
}
