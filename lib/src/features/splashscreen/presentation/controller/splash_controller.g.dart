// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SplashController)
const splashControllerProvider = SplashControllerProvider._();

final class SplashControllerProvider
    extends $AsyncNotifierProvider<SplashController, SplashAction?> {
  const SplashControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'splashControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  SplashController create() => SplashController();
}

String _$splashControllerHash() => r'8bb36e1768150465d33985024a6e35bdf4e34303';

abstract class _$SplashController extends $AsyncNotifier<SplashAction?> {
  FutureOr<SplashAction?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SplashAction?>, SplashAction?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SplashAction?>, SplashAction?>,
        AsyncValue<SplashAction?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
