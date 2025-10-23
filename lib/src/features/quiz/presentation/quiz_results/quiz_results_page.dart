import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: resultsState.when(
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
                    onBackPressed: () => context.router.maybePop(),
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
                          onRetakeQuiz: () {
                            // Navigate back to quiz dashboard or retake
                            context.router.maybePop();
                          },
                          onViewDetails: () {
                            // Show detailed results
                            _showDetailedResults(context, results);
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

  void _showDetailedResults(BuildContext context, QuizSetScore score) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Dettagli Risultati',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            // Detailed content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Modalità', score.mode.value),
                    _buildDetailRow('Esame', score.exam?.value ?? 'N/A'),
                    _buildDetailRow('Domande Risposte', '${score.answered}/${score.total}'),
                    _buildDetailRow('Risposte Corrette', '${score.correct}'),
                    _buildDetailRow('Risposte Sbagliate', '${score.wrong}'),
                    _buildDetailRow('Precisione', '${score.accuracyPct.toStringAsFixed(1)}%'),
                    if (score.customTopics != null && score.customTopics!.isNotEmpty)
                      _buildDetailRow('Argomenti', score.customTopics!.join(', ')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
