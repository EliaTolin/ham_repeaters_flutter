// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(leaderboardSupabaseDatasource)
const leaderboardSupabaseDatasourceProvider =
    LeaderboardSupabaseDatasourceProvider._();

final class LeaderboardSupabaseDatasourceProvider extends $FunctionalProvider<
    LeaderboardDatasource,
    LeaderboardDatasource,
    LeaderboardDatasource> with $Provider<LeaderboardDatasource> {
  const LeaderboardSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'leaderboardSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$leaderboardSupabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<LeaderboardDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LeaderboardDatasource create(Ref ref) {
    return leaderboardSupabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaderboardDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaderboardDatasource>(value),
    );
  }
}

String _$leaderboardSupabaseDatasourceHash() =>
    r'733e023c8fb42731e9cb4691ded2459a17a29e10';
