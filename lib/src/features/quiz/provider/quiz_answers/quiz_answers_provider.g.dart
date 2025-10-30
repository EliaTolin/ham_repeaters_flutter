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
        AsyncValue<List<QuizSetQuestionResultModel>>,
        List<QuizSetQuestionResultModel>,
        FutureOr<List<QuizSetQuestionResultModel>>>
    with
        $FutureModifier<List<QuizSetQuestionResultModel>>,
        $FutureProvider<List<QuizSetQuestionResultModel>> {
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
  $FutureProviderElement<List<QuizSetQuestionResultModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<QuizSetQuestionResultModel>> create(Ref ref) {
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

String _$quizAnswersHash() => r'0197c86c3dcaedfbd1ed5ddbf47629602ffe5b0c';

final class QuizAnswersFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<QuizSetQuestionResultModel>>,
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
