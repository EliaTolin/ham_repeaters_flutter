// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_quiz_scores_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allQuizScores)
const allQuizScoresProvider = AllQuizScoresProvider._();

final class AllQuizScoresProvider extends $FunctionalProvider<
        AsyncValue<List<QuizSetScore>>,
        List<QuizSetScore>,
        FutureOr<List<QuizSetScore>>>
    with
        $FutureModifier<List<QuizSetScore>>,
        $FutureProvider<List<QuizSetScore>> {
  const AllQuizScoresProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'allQuizScoresProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$allQuizScoresHash();

  @$internal
  @override
  $FutureProviderElement<List<QuizSetScore>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<QuizSetScore>> create(Ref ref) {
    return allQuizScores(ref);
  }
}

String _$allQuizScoresHash() => r'f4deed2529c4184587e97ebac25cc8395c012ca4';
