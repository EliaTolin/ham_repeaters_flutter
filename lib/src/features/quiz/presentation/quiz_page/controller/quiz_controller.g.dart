// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizController)
const quizControllerProvider = QuizControllerProvider._();

final class QuizControllerProvider
    extends $AsyncNotifierProvider<QuizController, Map<String, dynamic>?> {
  const QuizControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizControllerHash();

  @$internal
  @override
  QuizController create() => QuizController();
}

String _$quizControllerHash() => r'71415e0e37a2e29e89a2ede8f93595a77ce53b98';

abstract class _$QuizController extends $AsyncNotifier<Map<String, dynamic>?> {
  FutureOr<Map<String, dynamic>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<Map<String, dynamic>?>, Map<String, dynamic>?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Map<String, dynamic>?>, Map<String, dynamic>?>,
        AsyncValue<Map<String, dynamic>?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
