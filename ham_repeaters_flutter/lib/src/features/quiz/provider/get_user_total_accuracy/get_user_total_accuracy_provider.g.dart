// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_total_accuracy_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserTotalAccuracy)
const getUserTotalAccuracyProvider = GetUserTotalAccuracyFamily._();

final class GetUserTotalAccuracyProvider extends $FunctionalProvider<
        AsyncValue<TotalAccuracy?>, TotalAccuracy?, FutureOr<TotalAccuracy?>>
    with $FutureModifier<TotalAccuracy?>, $FutureProvider<TotalAccuracy?> {
  const GetUserTotalAccuracyProvider._(
      {required GetUserTotalAccuracyFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getUserTotalAccuracyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserTotalAccuracyHash();

  @override
  String toString() {
    return r'getUserTotalAccuracyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TotalAccuracy?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<TotalAccuracy?> create(Ref ref) {
    final argument = this.argument as String;
    return getUserTotalAccuracy(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserTotalAccuracyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserTotalAccuracyHash() =>
    r'dbedc11a8680a40c848288e7a99ebb8a5ea61898';

final class GetUserTotalAccuracyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TotalAccuracy?>, String> {
  const GetUserTotalAccuracyFamily._()
      : super(
          retry: null,
          name: r'getUserTotalAccuracyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetUserTotalAccuracyProvider call(
    String userId,
  ) =>
      GetUserTotalAccuracyProvider._(argument: userId, from: this);

  @override
  String toString() => r'getUserTotalAccuracyProvider';
}
