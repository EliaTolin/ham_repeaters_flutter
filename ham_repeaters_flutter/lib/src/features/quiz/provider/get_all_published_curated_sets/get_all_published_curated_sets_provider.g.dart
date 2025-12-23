// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_published_curated_sets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAllPublishedCuratedSets)
const getAllPublishedCuratedSetsProvider =
    GetAllPublishedCuratedSetsProvider._();

final class GetAllPublishedCuratedSetsProvider extends $FunctionalProvider<
        AsyncValue<List<CuratedSet>>,
        List<CuratedSet>,
        FutureOr<List<CuratedSet>>>
    with $FutureModifier<List<CuratedSet>>, $FutureProvider<List<CuratedSet>> {
  const GetAllPublishedCuratedSetsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getAllPublishedCuratedSetsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getAllPublishedCuratedSetsHash();

  @$internal
  @override
  $FutureProviderElement<List<CuratedSet>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<CuratedSet>> create(Ref ref) {
    return getAllPublishedCuratedSets(ref);
  }
}

String _$getAllPublishedCuratedSetsHash() =>
    r'5f7a9d68d347012fdb8156941ae8d1028dfdcd64';
