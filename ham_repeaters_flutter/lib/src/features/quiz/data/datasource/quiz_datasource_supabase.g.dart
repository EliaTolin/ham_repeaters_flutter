// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_datasource_supabase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizDataSourceSupabase)
const quizDataSourceSupabaseProvider = QuizDataSourceSupabaseProvider._();

final class QuizDataSourceSupabaseProvider extends $FunctionalProvider<
    QuizDataSourceSupabase,
    QuizDataSourceSupabase,
    QuizDataSourceSupabase> with $Provider<QuizDataSourceSupabase> {
  const QuizDataSourceSupabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizDataSourceSupabaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizDataSourceSupabaseHash();

  @$internal
  @override
  $ProviderElement<QuizDataSourceSupabase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizDataSourceSupabase create(Ref ref) {
    return quizDataSourceSupabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizDataSourceSupabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizDataSourceSupabase>(value),
    );
  }
}

String _$quizDataSourceSupabaseHash() =>
    r'b68c752e456f894f60414734766fa95bdc69853c';
