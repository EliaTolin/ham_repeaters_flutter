// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marathon_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MarathonController)
const marathonControllerProvider = MarathonControllerProvider._();

final class MarathonControllerProvider
    extends $AsyncNotifierProvider<MarathonController, MarathonState> {
  const MarathonControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'marathonControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$marathonControllerHash();

  @$internal
  @override
  MarathonController create() => MarathonController();
}

String _$marathonControllerHash() =>
    r'f8224138cf7b9cd1ddadbbde0746496d2240a1d5';

abstract class _$MarathonController extends $AsyncNotifier<MarathonState> {
  FutureOr<MarathonState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<MarathonState>, MarathonState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<MarathonState>, MarathonState>,
        AsyncValue<MarathonState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
