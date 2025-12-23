// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_quiz_scores_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentQuizScores)
const recentQuizScoresProvider = RecentQuizScoresFamily._();

final class RecentQuizScoresProvider extends $FunctionalProvider<
        AsyncValue<List<QuizSetScore>>,
        List<QuizSetScore>,
        FutureOr<List<QuizSetScore>>>
    with
        $FutureModifier<List<QuizSetScore>>,
        $FutureProvider<List<QuizSetScore>> {
  const RecentQuizScoresProvider._(
      {required RecentQuizScoresFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'recentQuizScoresProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentQuizScoresHash();

  @override
  String toString() {
    return r'recentQuizScoresProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<QuizSetScore>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<QuizSetScore>> create(Ref ref) {
    final argument = this.argument as int;
    return recentQuizScores(
      ref,
      limit: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecentQuizScoresProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recentQuizScoresHash() => r'9bc53fa8bb995dd780eadb5e3c9c89d6d87f015c';

final class RecentQuizScoresFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<QuizSetScore>>, int> {
  const RecentQuizScoresFamily._()
      : super(
          retry: null,
          name: r'recentQuizScoresProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RecentQuizScoresProvider call({
    int limit = 3,
  }) =>
      RecentQuizScoresProvider._(argument: limit, from: this);

  @override
  String toString() => r'recentQuizScoresProvider';
}
