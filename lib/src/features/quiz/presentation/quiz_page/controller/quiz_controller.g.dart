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
      required ({
        ExamType? examType,
        List<TopicRequest>? topics,
        String? curatedSetId,
      })
          super.argument})
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
        '$argument';
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

String _$quizControllerHash() => r'd235f04a2f66c6e6d49f697d439cf9b8d9f3fdc3';

final class QuizControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            QuizController,
            AsyncValue<QuizState?>,
            QuizState?,
            FutureOr<QuizState?>,
            ({
              ExamType? examType,
              List<TopicRequest>? topics,
              String? curatedSetId,
            })> {
  const QuizControllerFamily._()
      : super(
          retry: null,
          name: r'quizControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  QuizControllerProvider call({
    ExamType? examType,
    List<TopicRequest>? topics,
    String? curatedSetId,
  }) =>
      QuizControllerProvider._(argument: (
        examType: examType,
        topics: topics,
        curatedSetId: curatedSetId,
      ), from: this);

  @override
  String toString() => r'quizControllerProvider';
}

abstract class _$QuizController extends $AsyncNotifier<QuizState?> {
  late final _$args = ref.$arg as ({
    ExamType? examType,
    List<TopicRequest>? topics,
    String? curatedSetId,
  });
  ExamType? get examType => _$args.examType;
  List<TopicRequest>? get topics => _$args.topics;
  String? get curatedSetId => _$args.curatedSetId;

  FutureOr<QuizState?> build({
    ExamType? examType,
    List<TopicRequest>? topics,
    String? curatedSetId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      examType: _$args.examType,
      topics: _$args.topics,
      curatedSetId: _$args.curatedSetId,
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
