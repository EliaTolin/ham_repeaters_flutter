// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizDataSource)
const quizDataSourceProvider = QuizDataSourceProvider._();

final class QuizDataSourceProvider
    extends $FunctionalProvider<QuizDataSource, QuizDataSource, QuizDataSource>
    with $Provider<QuizDataSource> {
  const QuizDataSourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizDataSourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizDataSourceHash();

  @$internal
  @override
  $ProviderElement<QuizDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizDataSource create(Ref ref) {
    return quizDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizDataSource>(value),
    );
  }
}

String _$quizDataSourceHash() => r'970412b25f4cc9f325a1cf968eceeb7447d8da1b';
