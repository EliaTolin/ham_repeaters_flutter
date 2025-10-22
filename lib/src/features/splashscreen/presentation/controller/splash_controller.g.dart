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
    extends $AsyncNotifierProvider<SplashController, PageRouteInfo<Object?>> {
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

String _$splashControllerHash() => r'ec14cbe3ab5c5597de17a7ee9f382a49aaa9a1e0';

abstract class _$SplashController
    extends $AsyncNotifier<PageRouteInfo<Object?>> {
  FutureOr<PageRouteInfo<Object?>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<PageRouteInfo<Object?>>, PageRouteInfo<Object?>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<PageRouteInfo<Object?>>, PageRouteInfo<Object?>>,
        AsyncValue<PageRouteInfo<Object?>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
