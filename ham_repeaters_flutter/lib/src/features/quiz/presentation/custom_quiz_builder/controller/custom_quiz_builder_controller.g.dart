// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_quiz_builder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomQuizBuilderController)
const customQuizBuilderControllerProvider =
    CustomQuizBuilderControllerProvider._();

final class CustomQuizBuilderControllerProvider extends $AsyncNotifierProvider<
    CustomQuizBuilderController, CustomQuizBuilderState> {
  const CustomQuizBuilderControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'customQuizBuilderControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$customQuizBuilderControllerHash();

  @$internal
  @override
  CustomQuizBuilderController create() => CustomQuizBuilderController();
}

String _$customQuizBuilderControllerHash() =>
    r'4603d183742fa3942b5f4b92b1aab74540f593c0';

abstract class _$CustomQuizBuilderController
    extends $AsyncNotifier<CustomQuizBuilderState> {
  FutureOr<CustomQuizBuilderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<CustomQuizBuilderState>, CustomQuizBuilderState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<CustomQuizBuilderState>, CustomQuizBuilderState>,
        AsyncValue<CustomQuizBuilderState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
