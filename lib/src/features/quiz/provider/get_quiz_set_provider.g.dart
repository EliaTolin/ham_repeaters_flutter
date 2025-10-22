// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quiz_set_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getQuizSet)
const getQuizSetProvider = GetQuizSetFamily._();

final class GetQuizSetProvider extends $FunctionalProvider<
        AsyncValue<Map<String, dynamic>>,
        Map<String, dynamic>,
        FutureOr<Map<String, dynamic>>>
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  const GetQuizSetProvider._(
      {required GetQuizSetFamily super.from,
      required ({
        ExamType examType,
        String userId,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getQuizSetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getQuizSetHash();

  @override
  String toString() {
    return r'getQuizSetProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    final argument = this.argument as ({
      ExamType examType,
      String userId,
    });
    return getQuizSet(
      ref,
      examType: argument.examType,
      userId: argument.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuizSetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getQuizSetHash() => r'4eeff4ee54984b3ff83007063e11da209b377b0a';

final class GetQuizSetFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<Map<String, dynamic>>,
            ({
              ExamType examType,
              String userId,
            })> {
  const GetQuizSetFamily._()
      : super(
          retry: null,
          name: r'getQuizSetProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetQuizSetProvider call({
    required ExamType examType,
    required String userId,
  }) =>
      GetQuizSetProvider._(argument: (
        examType: examType,
        userId: userId,
      ), from: this);

  @override
  String toString() => r'getQuizSetProvider';
}
