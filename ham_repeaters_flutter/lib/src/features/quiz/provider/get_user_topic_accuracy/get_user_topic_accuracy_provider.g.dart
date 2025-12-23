// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_topic_accuracy_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserTopicAccuracy)
const getUserTopicAccuracyProvider = GetUserTopicAccuracyFamily._();

final class GetUserTopicAccuracyProvider extends $FunctionalProvider<
        AsyncValue<List<TopicAccuracy>>,
        List<TopicAccuracy>,
        FutureOr<List<TopicAccuracy>>>
    with
        $FutureModifier<List<TopicAccuracy>>,
        $FutureProvider<List<TopicAccuracy>> {
  const GetUserTopicAccuracyProvider._(
      {required GetUserTopicAccuracyFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getUserTopicAccuracyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserTopicAccuracyHash();

  @override
  String toString() {
    return r'getUserTopicAccuracyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TopicAccuracy>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TopicAccuracy>> create(Ref ref) {
    final argument = this.argument as String;
    return getUserTopicAccuracy(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserTopicAccuracyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserTopicAccuracyHash() =>
    r'2a6c88188a71e8655cf8def84439adc1a4a6c12c';

final class GetUserTopicAccuracyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TopicAccuracy>>, String> {
  const GetUserTopicAccuracyFamily._()
      : super(
          retry: null,
          name: r'getUserTopicAccuracyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetUserTopicAccuracyProvider call(
    String userId,
  ) =>
      GetUserTopicAccuracyProvider._(argument: userId, from: this);

  @override
  String toString() => r'getUserTopicAccuracyProvider';
}
