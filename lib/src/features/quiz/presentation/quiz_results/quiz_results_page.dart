import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/controller/quiz_results_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/widgets/quiz_accuracy_chart.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/widgets/quiz_action_buttons.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/widgets/quiz_results_header.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_results/widgets/quiz_statistics_card.dart';

@RoutePage()
class QuizResultsPage extends ConsumerWidget {
  const QuizResultsPage({
    required this.setId,
    super.key,
  });

  final String setId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsState = ref.watch(quizResultsControllerProvider(setId));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: resultsState.when(
          data: (results) {
            if (results == null) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Caricamento risultati...'),
                  ],
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                // Header with celebration animation
                SliverToBoxAdapter(
                  child: QuizResultsHeader(
                    score: results,
                  ),
                ),

                // Statistics cards
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),

                        // Main statistics grid
                        QuizStatisticsCard(score: results),

                        const SizedBox(height: 24),

                        // Accuracy chart
                        QuizAccuracyChart(score: results),

                        const SizedBox(height: 32),

                        // Action buttons
                        QuizActionButtons(
                          score: results,
                          onBackToHome: () {
                            context.router
                                .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
                          },
                          onRetakeQuiz: () {
                            context.router.popAndPush(
                              QuizRoute(examType: results.exam!),
                            );
                          },
                          onViewDetails: () {
                            // Navigate to detailed answers page
                            context.router.push(QuizAnswersRoute(setId: results.setId));
                          },
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Caricamento risultati...'),
              ],
            ),
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
                  'Errore nel caricamento dei risultati',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(quizResultsControllerProvider(setId));
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
}
