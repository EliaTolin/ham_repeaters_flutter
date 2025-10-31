// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_results_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizResultsController)
const quizResultsControllerProvider = QuizResultsControllerFamily._();

final class QuizResultsControllerProvider
    extends $AsyncNotifierProvider<QuizResultsController, QuizSetScore?> {
  const QuizResultsControllerProvider._(
      {required QuizResultsControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'quizResultsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizResultsControllerHash();

  @override
  String toString() {
    return r'quizResultsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QuizResultsController create() => QuizResultsController();

  @override
  bool operator ==(Object other) {
    return other is QuizResultsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizResultsControllerHash() =>
    r'98dcb8ab5b484205fcbc21272c4446d206512aa0';

final class QuizResultsControllerFamily extends $Family
    with
        $ClassFamilyOverride<QuizResultsController, AsyncValue<QuizSetScore?>,
            QuizSetScore?, FutureOr<QuizSetScore?>, String> {
  const QuizResultsControllerFamily._()
      : super(
          retry: null,
          name: r'quizResultsControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  QuizResultsControllerProvider call(
    String setId,
  ) =>
      QuizResultsControllerProvider._(argument: setId, from: this);

  @override
  String toString() => r'quizResultsControllerProvider';
}

abstract class _$QuizResultsController extends $AsyncNotifier<QuizSetScore?> {
  late final _$args = ref.$arg as String;
  String get setId => _$args;

  FutureOr<QuizSetScore?> build(
    String setId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<QuizSetScore?>, QuizSetScore?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<QuizSetScore?>, QuizSetScore?>,
        AsyncValue<QuizSetScore?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
