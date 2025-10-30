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
        AsyncValue<QuizSetResponse>, QuizSetResponse, FutureOr<QuizSetResponse>>
    with $FutureModifier<QuizSetResponse>, $FutureProvider<QuizSetResponse> {
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
  $FutureProviderElement<QuizSetResponse> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<QuizSetResponse> create(Ref ref) {
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

String _$getQuizSetHash() => r'8a02105f18ef4f64afea971cc6a14065b2dc11e5';

final class GetQuizSetFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<QuizSetResponse>,
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
