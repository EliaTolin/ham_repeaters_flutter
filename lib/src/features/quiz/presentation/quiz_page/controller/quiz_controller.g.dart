// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizController)
const quizControllerProvider = QuizControllerFamily._();

final class QuizControllerProvider
    extends $AsyncNotifierProvider<QuizController, QuizState?> {
  const QuizControllerProvider._(
      {required QuizControllerFamily super.from,
      required ExamType super.argument})
      : super(
          retry: null,
          name: r'quizControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizControllerHash();

  @override
  String toString() {
    return r'quizControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QuizController create() => QuizController();

  @override
  bool operator ==(Object other) {
    return other is QuizControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizControllerHash() => r'27f89fe1097796f3b4ca33bdb2fb0b1a2e3c5cfc';

final class QuizControllerFamily extends $Family
    with
        $ClassFamilyOverride<QuizController, AsyncValue<QuizState?>, QuizState?,
            FutureOr<QuizState?>, ExamType> {
  const QuizControllerFamily._()
      : super(
          retry: null,
          name: r'quizControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  QuizControllerProvider call(
    ExamType examType,
  ) =>
      QuizControllerProvider._(argument: examType, from: this);

  @override
  String toString() => r'quizControllerProvider';
}

abstract class _$QuizController extends $AsyncNotifier<QuizState?> {
  late final _$args = ref.$arg as ExamType;
  ExamType get examType => _$args;

  FutureOr<QuizState?> build(
    ExamType examType,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<QuizState?>, QuizState?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<QuizState?>, QuizState?>,
        AsyncValue<QuizState?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
