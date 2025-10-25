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
    QuizAnswersController, List<QuizSetQuestionResultModel>> {
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
    r'2d9e743aaf8c44849b313e1a41d5ac4cfec908c6';

final class QuizAnswersControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            QuizAnswersController,
            AsyncValue<List<QuizSetQuestionResultModel>>,
            List<QuizSetQuestionResultModel>,
            FutureOr<List<QuizSetQuestionResultModel>>,
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
    extends $AsyncNotifier<List<QuizSetQuestionResultModel>> {
  late final _$args = ref.$arg as String;
  String get setId => _$args;

  FutureOr<List<QuizSetQuestionResultModel>> build(
    String setId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<List<QuizSetQuestionResultModel>>,
        List<QuizSetQuestionResultModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<QuizSetQuestionResultModel>>,
            List<QuizSetQuestionResultModel>>,
        AsyncValue<List<QuizSetQuestionResultModel>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
