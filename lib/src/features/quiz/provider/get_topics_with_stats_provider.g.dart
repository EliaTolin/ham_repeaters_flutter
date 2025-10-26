// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_topics_with_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTopicsWithStats)
const getTopicsWithStatsProvider = GetTopicsWithStatsProvider._();

final class GetTopicsWithStatsProvider extends $FunctionalProvider<
        AsyncValue<List<TopicWithStats>>,
        List<TopicWithStats>,
        FutureOr<List<TopicWithStats>>>
    with
        $FutureModifier<List<TopicWithStats>>,
        $FutureProvider<List<TopicWithStats>> {
  const GetTopicsWithStatsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getTopicsWithStatsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getTopicsWithStatsHash();

  @$internal
  @override
  $FutureProviderElement<List<TopicWithStats>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TopicWithStats>> create(Ref ref) {
    return getTopicsWithStats(ref);
  }
}

String _$getTopicsWithStatsHash() =>
    r'8c87e7abc705f5b0ffebc83dba796dc617bc20cf';
