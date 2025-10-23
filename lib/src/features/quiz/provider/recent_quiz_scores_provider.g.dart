// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_quiz_scores_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentQuizScores)
const recentQuizScoresProvider = RecentQuizScoresProvider._();

final class RecentQuizScoresProvider extends $FunctionalProvider<
        AsyncValue<List<QuizSetScore>>,
        List<QuizSetScore>,
        FutureOr<List<QuizSetScore>>>
    with
        $FutureModifier<List<QuizSetScore>>,
        $FutureProvider<List<QuizSetScore>> {
  const RecentQuizScoresProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentQuizScoresProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentQuizScoresHash();

  @$internal
  @override
  $FutureProviderElement<List<QuizSetScore>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<QuizSetScore>> create(Ref ref) {
    return recentQuizScores(ref);
  }
}

String _$recentQuizScoresHash() => r'075fce78b11c2b5ee9e4ca8cb6e03d552daed0bd';
