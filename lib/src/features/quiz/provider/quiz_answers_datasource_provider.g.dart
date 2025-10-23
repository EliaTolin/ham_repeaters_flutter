// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answers_datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizAnswersDataSource)
const quizAnswersDataSourceProvider = QuizAnswersDataSourceProvider._();

final class QuizAnswersDataSourceProvider extends $FunctionalProvider<
    QuizAnswersDataSource,
    QuizAnswersDataSource,
    QuizAnswersDataSource> with $Provider<QuizAnswersDataSource> {
  const QuizAnswersDataSourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizAnswersDataSourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizAnswersDataSourceHash();

  @$internal
  @override
  $ProviderElement<QuizAnswersDataSource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizAnswersDataSource create(Ref ref) {
    return quizAnswersDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizAnswersDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizAnswersDataSource>(value),
    );
  }
}

String _$quizAnswersDataSourceHash() =>
    r'5e04bc28129da561dd3d61fda1bbf8f89182d4e4';
