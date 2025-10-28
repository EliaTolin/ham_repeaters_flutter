// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StatisticsController)
const statisticsControllerProvider = StatisticsControllerProvider._();

final class StatisticsControllerProvider
    extends $AsyncNotifierProvider<StatisticsController, StatisticsState> {
  const StatisticsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'statisticsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$statisticsControllerHash();

  @$internal
  @override
  StatisticsController create() => StatisticsController();
}

String _$statisticsControllerHash() =>
    r'43e28cc4bd7909bbf1d378983486450bcb028ec8';

abstract class _$StatisticsController extends $AsyncNotifier<StatisticsState> {
  FutureOr<StatisticsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<StatisticsState>, StatisticsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<StatisticsState>, StatisticsState>,
        AsyncValue<StatisticsState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
