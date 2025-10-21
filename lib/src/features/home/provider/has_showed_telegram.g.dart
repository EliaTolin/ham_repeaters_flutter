// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_showed_telegram.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hasShowedTelegram)
const hasShowedTelegramProvider = HasShowedTelegramProvider._();

final class HasShowedTelegramProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const HasShowedTelegramProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'hasShowedTelegramProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hasShowedTelegramHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasShowedTelegram(ref);
  }
}

String _$hasShowedTelegramHash() => r'535357fd50cb46c0d5640abf1e4b63027897fb83';
