import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mobile_ads_client.g.dart';

@riverpod
Future<MobileAds> mobileAds(Ref ref) async {
  final mobileAds = MobileAds.instance;
  await mobileAds.initialize();
  log('MobileAds initialized');
  return mobileAds;
}
