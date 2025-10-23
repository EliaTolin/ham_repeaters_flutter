// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizDashboardController)
const quizDashboardControllerProvider = QuizDashboardControllerProvider._();

final class QuizDashboardControllerProvider extends $AsyncNotifierProvider<
    QuizDashboardController, QuizDashboardState> {
  const QuizDashboardControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizDashboardControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizDashboardControllerHash();

  @$internal
  @override
  QuizDashboardController create() => QuizDashboardController();
}

String _$quizDashboardControllerHash() =>
    r'a5d21fe1afa1e823ad7611f109d34a485c090dbc';

abstract class _$QuizDashboardController
    extends $AsyncNotifier<QuizDashboardState> {
  FutureOr<QuizDashboardState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<QuizDashboardState>, QuizDashboardState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<QuizDashboardState>, QuizDashboardState>,
        AsyncValue<QuizDashboardState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
