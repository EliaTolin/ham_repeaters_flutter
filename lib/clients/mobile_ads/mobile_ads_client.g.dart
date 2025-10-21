// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_ads_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mobileAds)
const mobileAdsProvider = MobileAdsProvider._();

final class MobileAdsProvider extends $FunctionalProvider<AsyncValue<MobileAds>,
        MobileAds, FutureOr<MobileAds>>
    with $FutureModifier<MobileAds>, $FutureProvider<MobileAds> {
  const MobileAdsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'mobileAdsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$mobileAdsHash();

  @$internal
  @override
  $FutureProviderElement<MobileAds> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MobileAds> create(Ref ref) {
    return mobileAds(ref);
  }
}

String _$mobileAdsHash() => r'9c41b178d21bcc6b6cf5272670d5f4dfd09c892a';
