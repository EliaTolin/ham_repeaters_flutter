// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizDataSource)
const quizDataSourceProvider = QuizDataSourceProvider._();

final class QuizDataSourceProvider extends $FunctionalProvider<
    QuizSupabaseDataSource,
    QuizSupabaseDataSource,
    QuizSupabaseDataSource> with $Provider<QuizSupabaseDataSource> {
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
  $ProviderElement<QuizSupabaseDataSource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizSupabaseDataSource create(Ref ref) {
    return quizDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizSupabaseDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizSupabaseDataSource>(value),
    );
  }
}

String _$quizDataSourceHash() => r'0de57af2c44f037ae23eaa3516fe8fbb83326d20';
