// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_all_quiz_set_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteAllQuizSet)
const deleteAllQuizSetProvider = DeleteAllQuizSetFamily._();

final class DeleteAllQuizSetProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteAllQuizSetProvider._(
      {required DeleteAllQuizSetFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'deleteAllQuizSetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteAllQuizSetHash();

  @override
  String toString() {
    return r'deleteAllQuizSetProvider'
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
    return deleteAllQuizSet(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteAllQuizSetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteAllQuizSetHash() => r'3d0ce3070aa428f6f6973a6af7873fd4108b7317';

final class DeleteAllQuizSetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const DeleteAllQuizSetFamily._()
      : super(
          retry: null,
          name: r'deleteAllQuizSetProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteAllQuizSetProvider call(
    String userId,
  ) =>
      DeleteAllQuizSetProvider._(argument: userId, from: this);

  @override
  String toString() => r'deleteAllQuizSetProvider';
}
