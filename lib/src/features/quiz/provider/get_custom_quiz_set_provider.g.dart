// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_custom_quiz_set_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCustomQuizSet)
const getCustomQuizSetProvider = GetCustomQuizSetFamily._();

final class GetCustomQuizSetProvider extends $FunctionalProvider<
        AsyncValue<QuizSetResponse>, QuizSetResponse, FutureOr<QuizSetResponse>>
    with $FutureModifier<QuizSetResponse>, $FutureProvider<QuizSetResponse> {
  const GetCustomQuizSetProvider._(
      {required GetCustomQuizSetFamily super.from,
      required ({
        List<TopicRequest> topics,
        String userId,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getCustomQuizSetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getCustomQuizSetHash();

  @override
  String toString() {
    return r'getCustomQuizSetProvider'
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
      List<TopicRequest> topics,
      String userId,
    });
    return getCustomQuizSet(
      ref,
      topics: argument.topics,
      userId: argument.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetCustomQuizSetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCustomQuizSetHash() => r'9d36fa4ad7816419b9fcc32a25c4a2648851ac07';

final class GetCustomQuizSetFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<QuizSetResponse>,
            ({
              List<TopicRequest> topics,
              String userId,
            })> {
  const GetCustomQuizSetFamily._()
      : super(
          retry: null,
          name: r'getCustomQuizSetProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetCustomQuizSetProvider call({
    required List<TopicRequest> topics,
    required String userId,
  }) =>
      GetCustomQuizSetProvider._(argument: (
        topics: topics,
        userId: userId,
      ), from: this);

  @override
  String toString() => r'getCustomQuizSetProvider';
}
