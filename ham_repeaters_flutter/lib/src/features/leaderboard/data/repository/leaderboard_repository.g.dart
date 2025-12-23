// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(leaderboardRepository)
const leaderboardRepositoryProvider = LeaderboardRepositoryProvider._();

final class LeaderboardRepositoryProvider extends $FunctionalProvider<
    LeaderboardRepository,
    LeaderboardRepository,
    LeaderboardRepository> with $Provider<LeaderboardRepository> {
  const LeaderboardRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'leaderboardRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$leaderboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<LeaderboardRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LeaderboardRepository create(Ref ref) {
    return leaderboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaderboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaderboardRepository>(value),
    );
  }
}

String _$leaderboardRepositoryHash() =>
    r'fa1390e3c5fd33ed96750d6bde15bc596767f288';
