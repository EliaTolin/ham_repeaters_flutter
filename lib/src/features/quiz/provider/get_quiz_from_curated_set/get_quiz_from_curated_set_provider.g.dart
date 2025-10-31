// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quiz_from_curated_set_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getQuizFromCuratedSet)
const getQuizFromCuratedSetProvider = GetQuizFromCuratedSetFamily._();

final class GetQuizFromCuratedSetProvider extends $FunctionalProvider<
        AsyncValue<QuizSetResponse>, QuizSetResponse, FutureOr<QuizSetResponse>>
    with $FutureModifier<QuizSetResponse>, $FutureProvider<QuizSetResponse> {
  const GetQuizFromCuratedSetProvider._(
      {required GetQuizFromCuratedSetFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getQuizFromCuratedSetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getQuizFromCuratedSetHash();

  @override
  String toString() {
    return r'getQuizFromCuratedSetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<QuizSetResponse> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<QuizSetResponse> create(Ref ref) {
    final argument = this.argument as String;
    return getQuizFromCuratedSet(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizFromCuratedSetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getQuizFromCuratedSetHash() =>
    r'008c05a8ed4ad730098fc2f3214f8643e1c4d5ed';

final class GetQuizFromCuratedSetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<QuizSetResponse>, String> {
  const GetQuizFromCuratedSetFamily._()
      : super(
          retry: null,
          name: r'getQuizFromCuratedSetProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetQuizFromCuratedSetProvider call(
    String curatedSetId,
  ) =>
      GetQuizFromCuratedSetProvider._(argument: curatedSetId, from: this);

  @override
  String toString() => r'getQuizFromCuratedSetProvider';
}
