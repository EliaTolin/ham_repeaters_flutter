// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answers_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizAnswersRepository)
const quizAnswersRepositoryProvider = QuizAnswersRepositoryProvider._();

final class QuizAnswersRepositoryProvider extends $FunctionalProvider<
    QuizAnswersRepository,
    QuizAnswersRepository,
    QuizAnswersRepository> with $Provider<QuizAnswersRepository> {
  const QuizAnswersRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quizAnswersRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quizAnswersRepositoryHash();

  @$internal
  @override
  $ProviderElement<QuizAnswersRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizAnswersRepository create(Ref ref) {
    return quizAnswersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizAnswersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizAnswersRepository>(value),
    );
  }
}

String _$quizAnswersRepositoryHash() =>
    r'6d6b5f0e8939906cb96dd5f7995cf07eb4e9f762';
