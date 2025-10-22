// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizDashboardController)
const quizDashboardControllerProvider = QuizDashboardControllerProvider._();

final class QuizDashboardControllerProvider
    extends $NotifierProvider<QuizDashboardController, QuizDashboardState> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizDashboardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizDashboardState>(value),
    );
  }
}

String _$quizDashboardControllerHash() =>
    r'28db730b1201bc713c1451cde4c6fa6030200557';

abstract class _$QuizDashboardController extends $Notifier<QuizDashboardState> {
  QuizDashboardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<QuizDashboardState, QuizDashboardState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<QuizDashboardState, QuizDashboardState>,
        QuizDashboardState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
