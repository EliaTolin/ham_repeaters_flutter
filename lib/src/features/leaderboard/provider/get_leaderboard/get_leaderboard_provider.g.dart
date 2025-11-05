// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_leaderboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getLeaderboard)
const getLeaderboardProvider = GetLeaderboardFamily._();

final class GetLeaderboardProvider extends $FunctionalProvider<
        AsyncValue<List<LeaderboardEntry>>,
        List<LeaderboardEntry>,
        FutureOr<List<LeaderboardEntry>>>
    with
        $FutureModifier<List<LeaderboardEntry>>,
        $FutureProvider<List<LeaderboardEntry>> {
  const GetLeaderboardProvider._(
      {required GetLeaderboardFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'getLeaderboardProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getLeaderboardHash();

  @override
  String toString() {
    return r'getLeaderboardProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LeaderboardEntry>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<LeaderboardEntry>> create(Ref ref) {
    final argument = this.argument as int;
    return getLeaderboard(
      ref,
      limit: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetLeaderboardProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getLeaderboardHash() => r'c410dea7aca8dd8fc96aca14aa305307d09a123b';

final class GetLeaderboardFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<LeaderboardEntry>>, int> {
  const GetLeaderboardFamily._()
      : super(
          retry: null,
          name: r'getLeaderboardProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetLeaderboardProvider call({
    int limit = 20,
  }) =>
      GetLeaderboardProvider._(argument: limit, from: this);

  @override
  String toString() => r'getLeaderboardProvider';
}
