// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_quiz_set_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteQuizSet)
const deleteQuizSetProvider = DeleteQuizSetFamily._();

final class DeleteQuizSetProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteQuizSetProvider._(
      {required DeleteQuizSetFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'deleteQuizSetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteQuizSetHash();

  @override
  String toString() {
    return r'deleteQuizSetProvider'
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
    return deleteQuizSet(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteQuizSetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteQuizSetHash() => r'282632eac136ff61ec5b7372607ba98c962fd4a0';

final class DeleteQuizSetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const DeleteQuizSetFamily._()
      : super(
          retry: null,
          name: r'deleteQuizSetProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteQuizSetProvider call(
    String quizSetId,
  ) =>
      DeleteQuizSetProvider._(argument: quizSetId, from: this);

  @override
  String toString() => r'deleteQuizSetProvider';
}
