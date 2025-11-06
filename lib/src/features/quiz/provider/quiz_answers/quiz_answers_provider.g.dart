// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizAnswers)
const quizAnswersProvider = QuizAnswersFamily._();

final class QuizAnswersProvider extends $FunctionalProvider<
        AsyncValue<List<QuizSetQuestionResult>>,
        List<QuizSetQuestionResult>,
        FutureOr<List<QuizSetQuestionResult>>>
    with
        $FutureModifier<List<QuizSetQuestionResult>>,
        $FutureProvider<List<QuizSetQuestionResult>> {
  const QuizAnswersProvider._(
      {required QuizAnswersFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'quizAnswersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizAnswersHash();

  @override
  String toString() {
    return r'quizAnswersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<QuizSetQuestionResult>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<QuizSetQuestionResult>> create(Ref ref) {
    final argument = this.argument as String;
    return quizAnswers(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QuizAnswersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizAnswersHash() => r'340373e06202b3f5e631c10b0f3270b2813bf1a9';

final class QuizAnswersFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<QuizSetQuestionResult>>,
            String> {
  const QuizAnswersFamily._()
      : super(
          retry: null,
          name: r'quizAnswersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  QuizAnswersProvider call(
    String setId,
  ) =>
      QuizAnswersProvider._(argument: setId, from: this);

  @override
  String toString() => r'quizAnswersProvider';
}
