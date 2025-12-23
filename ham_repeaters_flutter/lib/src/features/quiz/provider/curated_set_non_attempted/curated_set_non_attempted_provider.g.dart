// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_set_non_attempted_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(curatedSetNonAttempted)
const curatedSetNonAttemptedProvider = CuratedSetNonAttemptedFamily._();

final class CuratedSetNonAttemptedProvider extends $FunctionalProvider<
        AsyncValue<List<CuratedSetPreview>>,
        List<CuratedSetPreview>,
        FutureOr<List<CuratedSetPreview>>>
    with
        $FutureModifier<List<CuratedSetPreview>>,
        $FutureProvider<List<CuratedSetPreview>> {
  const CuratedSetNonAttemptedProvider._(
      {required CuratedSetNonAttemptedFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'curatedSetNonAttemptedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$curatedSetNonAttemptedHash();

  @override
  String toString() {
    return r'curatedSetNonAttemptedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CuratedSetPreview>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<CuratedSetPreview>> create(Ref ref) {
    final argument = this.argument as String;
    return curatedSetNonAttempted(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CuratedSetNonAttemptedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$curatedSetNonAttemptedHash() =>
    r'f8bd300e2ff4bc8c587f3909684bbb86c341125a';

final class CuratedSetNonAttemptedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CuratedSetPreview>>, String> {
  const CuratedSetNonAttemptedFamily._()
      : super(
          retry: null,
          name: r'curatedSetNonAttemptedProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CuratedSetNonAttemptedProvider call(
    String userId,
  ) =>
      CuratedSetNonAttemptedProvider._(argument: userId, from: this);

  @override
  String toString() => r'curatedSetNonAttemptedProvider';
}
