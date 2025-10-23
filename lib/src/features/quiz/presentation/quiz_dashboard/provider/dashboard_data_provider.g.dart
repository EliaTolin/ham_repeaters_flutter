// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data_provider.dart';

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

String _$recentQuizScoresHash() => r'f101b86dd0f4569f3aa1c22f6da66dd467baa79a';

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

String _$allQuizScoresHash() => r'755feef264951b5146ebb67a5468b758910b1a26';
