import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/repository/quiz_repository.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic_request.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/controller/quiz_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/state/quiz_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/widgets/quiz_navigation_widget.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/widgets/quiz_progress_widget.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/widgets/quiz_question_widget.dart';

@RoutePage()
class QuizPage extends HookConsumerWidget {
  const QuizPage({this.examType, this.topics, super.key});
  final ExamType? examType;
  final List<TopicRequest>? topics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizControllerProvider(examType: examType, topics: topics));

    // Listen for quiz completion and navigate to results
    ref.listen<AsyncValue<QuizState?>>(quizControllerProvider(examType: examType, topics: topics),
        (previous, next) {
      next.whenData((data) {
        if (data?.isCompleted ?? false) {
          context.router.pushAndPopUntil(
            QuizResultsRoute(setId: data!.quizSet.quizSetId),
            predicate: (_) => false,
          );
        }
      });
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await _showExitConfirmationDialog(context);
        if (shouldExit && context.mounted) {
          // Delete the quiz and go back
          await _deleteQuizAndExit(context, ref);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.primary),
            onPressed: () async {
              final shouldExit = await _showExitConfirmationDialog(context);
              if (shouldExit && context.mounted) {
                await _deleteQuizAndExit(context, ref);
              }
            },
          ),
          title: Text(
            'Quiz',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
        ),
        body: quizState.when(
          data: (state) {
            if (state == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [
                // Progress bar
                QuizProgressWidget(
                  currentIndex: state.currentQuestionIndex,
                  totalQuestions: state.totalQuestions,
                  answeredQuestions: state.answeredQuestions,
                ),

                // Question widget
                Expanded(
                  child: QuizQuestionWidget(
                    question: state.currentQuestion,
                    currentAnswer: state.currentAnswer,
                    topicLabel: _getTopicLabel(state.topics, state.currentQuestion.topicName),
                    onAnswerSelected: (answer) {
                      ref
                          .read(quizControllerProvider(examType: examType, topics: topics).notifier)
                          .answerQuestion(answer);
                    },
                  ),
                ),

                // Navigation widget
                QuizNavigationWidget(
                  canGoPrevious: state.canGoPrevious,
                  canGoNext: state.canGoNext,
                  canSubmit: state.canSubmit,
                  isSubmitting: state.isSubmitting,
                  onPrevious: () {
                    ref
                        .read(quizControllerProvider(examType: examType, topics: topics).notifier)
                        .goToPreviousQuestion();
                  },
                  onNext: () {
                    ref
                        .read(quizControllerProvider(examType: examType, topics: topics).notifier)
                        .goToNextQuestion();
                  },
                  onSubmit: () {
                    ref
                        .read(quizControllerProvider(examType: examType, topics: topics).notifier)
                        .submitQuiz();
                  },
                ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Errore nel caricamento del quiz',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(quizControllerProvider(examType: examType, topics: topics));
                  },
                  child: const Text('Riprova'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Theme.of(context).colorScheme.error,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text('Conferma Uscita'),
                ],
              ),
              content: const Text(
                'Sei sicuro di voler terminare questo quiz? I progressi verranno eliminati e non potrai recuperarli.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Continua Quiz',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Theme.of(context).colorScheme.onError,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Termina Quiz'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<void> _deleteQuizAndExit(BuildContext context, WidgetRef ref) async {
    try {
      // Get the current quiz state
      final quizState = ref.read(quizControllerProvider(examType: examType, topics: topics));

      if (quizState.hasValue && quizState.value != null) {
        final state = quizState.value;

        // Delete the quiz from the database
        await ref.read(quizRepositoryProvider).deleteQuizAnswers(state!.quizSet.quizSetId);

        // Show success message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Quiz eliminato con successo'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      }

      // Navigate back to dashboard
      if (context.mounted) {
        context.router.pop();
      }
    } catch (e) {
      // Show error message but still navigate back
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Errore durante l'eliminazione: $e"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        context.router.pop();
      }
    }
  }

  String _getTopicLabel(List<Topic> topics, String topicName) {
    try {
      return topics.firstWhere((topic) => topic.name == topicName).label;
    } catch (e) {
      return '';
    }
  }
}
