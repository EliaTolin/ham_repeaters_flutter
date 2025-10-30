// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_topics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTopics)
const getTopicsProvider = GetTopicsProvider._();

final class GetTopicsProvider extends $FunctionalProvider<
        AsyncValue<List<Topic>>, List<Topic>, FutureOr<List<Topic>>>
    with $FutureModifier<List<Topic>>, $FutureProvider<List<Topic>> {
  const GetTopicsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getTopicsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getTopicsHash();

  @$internal
  @override
  $FutureProviderElement<List<Topic>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Topic>> create(Ref ref) {
    return getTopics(ref);
  }
}

String _$getTopicsHash() => r'2e200f6c609a3f3bbc787c45be4dd577df4cef72';
