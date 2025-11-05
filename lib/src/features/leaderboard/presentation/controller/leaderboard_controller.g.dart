// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LeaderboardController)
const leaderboardControllerProvider = LeaderboardControllerFamily._();

final class LeaderboardControllerProvider extends $AsyncNotifierProvider<
    LeaderboardController, List<LeaderboardEntry>> {
  const LeaderboardControllerProvider._(
      {required LeaderboardControllerFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'leaderboardControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$leaderboardControllerHash();

  @override
  String toString() {
    return r'leaderboardControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LeaderboardController create() => LeaderboardController();

  @override
  bool operator ==(Object other) {
    return other is LeaderboardControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$leaderboardControllerHash() =>
    r'bac393569fecaa835ca84f424608f8cc32bd5ccf';

final class LeaderboardControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            LeaderboardController,
            AsyncValue<List<LeaderboardEntry>>,
            List<LeaderboardEntry>,
            FutureOr<List<LeaderboardEntry>>,
            int> {
  const LeaderboardControllerFamily._()
      : super(
          retry: null,
          name: r'leaderboardControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LeaderboardControllerProvider call({
    int limit = 20,
  }) =>
      LeaderboardControllerProvider._(argument: limit, from: this);

  @override
  String toString() => r'leaderboardControllerProvider';
}

abstract class _$LeaderboardController
    extends $AsyncNotifier<List<LeaderboardEntry>> {
  late final _$args = ref.$arg as int;
  int get limit => _$args;

  FutureOr<List<LeaderboardEntry>> build({
    int limit = 20,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      limit: _$args,
    );
    final ref = this.ref
        as $Ref<AsyncValue<List<LeaderboardEntry>>, List<LeaderboardEntry>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<LeaderboardEntry>>, List<LeaderboardEntry>>,
        AsyncValue<List<LeaderboardEntry>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
