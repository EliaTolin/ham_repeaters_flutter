// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_position_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserPosition)
const getUserPositionProvider = GetUserPositionProvider._();

final class GetUserPositionProvider extends $FunctionalProvider<
        AsyncValue<LeaderboardEntry?>,
        LeaderboardEntry?,
        FutureOr<LeaderboardEntry?>>
    with
        $FutureModifier<LeaderboardEntry?>,
        $FutureProvider<LeaderboardEntry?> {
  const GetUserPositionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUserPositionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserPositionHash();

  @$internal
  @override
  $FutureProviderElement<LeaderboardEntry?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LeaderboardEntry?> create(Ref ref) {
    return getUserPosition(ref);
  }
}

String _$getUserPositionHash() => r'9577dd3f09a3aee4b64340bb51f9bb1dadcc7f09';
