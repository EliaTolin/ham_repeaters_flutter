// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answers_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizAnswersController)
const quizAnswersControllerProvider = QuizAnswersControllerFamily._();

final class QuizAnswersControllerProvider extends $AsyncNotifierProvider<
    QuizAnswersController, List<QuizSetQuestionResult>> {
  const QuizAnswersControllerProvider._(
      {required QuizAnswersControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'quizAnswersControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizAnswersControllerHash();

  @override
  String toString() {
    return r'quizAnswersControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QuizAnswersController create() => QuizAnswersController();

  @override
  bool operator ==(Object other) {
    return other is QuizAnswersControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizAnswersControllerHash() =>
    r'8da8838d058febed3381b7ee0fac950c8ea7bdae';

final class QuizAnswersControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            QuizAnswersController,
            AsyncValue<List<QuizSetQuestionResult>>,
            List<QuizSetQuestionResult>,
            FutureOr<List<QuizSetQuestionResult>>,
            String> {
  const QuizAnswersControllerFamily._()
      : super(
          retry: null,
          name: r'quizAnswersControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  QuizAnswersControllerProvider call(
    String setId,
  ) =>
      QuizAnswersControllerProvider._(argument: setId, from: this);

  @override
  String toString() => r'quizAnswersControllerProvider';
}

abstract class _$QuizAnswersController
    extends $AsyncNotifier<List<QuizSetQuestionResult>> {
  late final _$args = ref.$arg as String;
  String get setId => _$args;

  FutureOr<List<QuizSetQuestionResult>> build(
    String setId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<List<QuizSetQuestionResult>>,
        List<QuizSetQuestionResult>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<QuizSetQuestionResult>>,
            List<QuizSetQuestionResult>>,
        AsyncValue<List<QuizSetQuestionResult>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
