// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_statistics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizStatisticsController)
const quizStatisticsControllerProvider = QuizStatisticsControllerProvider._();

final class QuizStatisticsControllerProvider extends $AsyncNotifierProvider<
    QuizStatisticsController, List<QuizSetScore>> {
  const QuizStatisticsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizStatisticsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizStatisticsControllerHash();

  @$internal
  @override
  QuizStatisticsController create() => QuizStatisticsController();
}

String _$quizStatisticsControllerHash() =>
    r'b3142e294e46fe371bcd66ebd61e289a5f59c7d4';

abstract class _$QuizStatisticsController
    extends $AsyncNotifier<List<QuizSetScore>> {
  FutureOr<List<QuizSetScore>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<QuizSetScore>>, List<QuizSetScore>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<QuizSetScore>>, List<QuizSetScore>>,
        AsyncValue<List<QuizSetScore>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
