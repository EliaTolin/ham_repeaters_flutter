// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_apple_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInWithApple)
const signInWithAppleProvider = SignInWithAppleProvider._();

final class SignInWithAppleProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const SignInWithAppleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signInWithAppleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signInWithAppleHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return signInWithApple(ref);
  }
}

String _$signInWithAppleHash() => r'd1eca7b8b0dae4b1e633ac902323a8d6ca472512';
