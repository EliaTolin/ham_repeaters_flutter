// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_sets_archive_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CuratedSetsArchiveController)
const curatedSetsArchiveControllerProvider =
    CuratedSetsArchiveControllerProvider._();

final class CuratedSetsArchiveControllerProvider extends $AsyncNotifierProvider<
    CuratedSetsArchiveController, CuratedSetsArchiveState> {
  const CuratedSetsArchiveControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'curatedSetsArchiveControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$curatedSetsArchiveControllerHash();

  @$internal
  @override
  CuratedSetsArchiveController create() => CuratedSetsArchiveController();
}

String _$curatedSetsArchiveControllerHash() =>
    r'7b47af75a7b61cd0de40914baa537bed0862fd8a';

abstract class _$CuratedSetsArchiveController
    extends $AsyncNotifier<CuratedSetsArchiveState> {
  FutureOr<CuratedSetsArchiveState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<CuratedSetsArchiveState>, CuratedSetsArchiveState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<CuratedSetsArchiveState>,
            CuratedSetsArchiveState>,
        AsyncValue<CuratedSetsArchiveState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
