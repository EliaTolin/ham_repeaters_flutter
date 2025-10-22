// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizRepository)
const quizRepositoryProvider = QuizRepositoryProvider._();

final class QuizRepositoryProvider
    extends $FunctionalProvider<QuizRepository, QuizRepository, QuizRepository>
    with $Provider<QuizRepository> {
  const QuizRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizRepositoryHash();

  @$internal
  @override
  $ProviderElement<QuizRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizRepository create(Ref ref) {
    return quizRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizRepository>(value),
    );
  }
}

String _$quizRepositoryHash() => r'a0283dc6b01561703d8fcda0ecf48abdc22b7b73';
