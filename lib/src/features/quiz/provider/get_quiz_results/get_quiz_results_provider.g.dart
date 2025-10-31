// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quiz_results_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getQuizResults)
const getQuizResultsProvider = GetQuizResultsFamily._();

final class GetQuizResultsProvider extends $FunctionalProvider<
        AsyncValue<QuizSetScore?>, QuizSetScore?, FutureOr<QuizSetScore?>>
    with $FutureModifier<QuizSetScore?>, $FutureProvider<QuizSetScore?> {
  const GetQuizResultsProvider._(
      {required GetQuizResultsFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getQuizResultsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getQuizResultsHash();

  @override
  String toString() {
    return r'getQuizResultsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<QuizSetScore?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<QuizSetScore?> create(Ref ref) {
    final argument = this.argument as String;
    return getQuizResults(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizResultsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getQuizResultsHash() => r'1c8da324c61f9619a035b2f8cfb2ad063c16ad9f';

final class GetQuizResultsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<QuizSetScore?>, String> {
  const GetQuizResultsFamily._()
      : super(
          retry: null,
          name: r'getQuizResultsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetQuizResultsProvider call(
    String setId,
  ) =>
      GetQuizResultsProvider._(argument: setId, from: this);

  @override
  String toString() => r'getQuizResultsProvider';
}
