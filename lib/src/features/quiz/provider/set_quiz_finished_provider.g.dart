// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_quiz_finished_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setQuizFinished)
const setQuizFinishedProvider = SetQuizFinishedFamily._();

final class SetQuizFinishedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const SetQuizFinishedProvider._(
      {required SetQuizFinishedFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'setQuizFinishedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$setQuizFinishedHash();

  @override
  String toString() {
    return r'setQuizFinishedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return setQuizFinished(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SetQuizFinishedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setQuizFinishedHash() => r'f74fd534b4a177ee884db5d5b5a1c018e2270734';

final class SetQuizFinishedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const SetQuizFinishedFamily._()
      : super(
          retry: null,
          name: r'setQuizFinishedProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SetQuizFinishedProvider call(
    String setId,
  ) =>
      SetQuizFinishedProvider._(argument: setId, from: this);

  @override
  String toString() => r'setQuizFinishedProvider';
}
