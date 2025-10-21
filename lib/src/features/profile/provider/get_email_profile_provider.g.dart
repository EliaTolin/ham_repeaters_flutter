// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_email_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getEmailProfile)
const getEmailProfileProvider = GetEmailProfileProvider._();

final class GetEmailProfileProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const GetEmailProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getEmailProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getEmailProfileHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return getEmailProfile(ref);
  }
}

String _$getEmailProfileHash() => r'9d5bb75c19bcc638e20b4f00263cde182b8047c1';
