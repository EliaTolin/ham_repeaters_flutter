import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ham_repeaters/common/dialogs/are_you_sure_to_delete_dialog.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_accuracy/topic_accuracy.dart';
import 'package:ham_repeaters/src/features/quiz/domain/total_accuracy/total_accuracy.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/widgets/recent_quizzes_section.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/statistics/controller/statistics_controller.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/statistics/state/statistics_state/statistics_state.dart';
import 'package:ham_repeaters/src/features/quiz/provider/all_quiz_scores/all_quiz_scores_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_user_topic_accuracy/get_user_topic_accuracy_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/get_user_total_accuracy/get_user_total_accuracy_provider.dart';
import 'package:ham_repeaters/src/features/quiz/provider/recent_quiz_scores/recent_quiz_scores_provider.dart';

@RoutePage()
class QuizStatisticsPage extends HookConsumerWidget {
  const QuizStatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(statisticsControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.analytics_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            const Text('Statistiche'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services_rounded),
            onPressed: () async {
              final isOk = await showAreYouSureToDeleteDialog(
                context,
                title: 'Sei sicuro di voler cancellare tutti i tuoi quiz?',
                content:
                    'Perderai tutti i tuoi progressi e ripartirai da zero.',
                barrierDismissible: true,
              );
              if (isOk && context.mounted) {
                await ref
                    .read(statisticsControllerProvider.notifier)
                    .deleteAllQuizSet();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref
                    ..invalidate(recentQuizScoresProvider)
                    ..invalidate(allQuizScoresProvider)
                    ..invalidate(getUserTopicAccuracyProvider)
                    ..invalidate(getUserTotalAccuracyProvider);
                });
              }
            },
          ),
        ],
      ),
      body: state.when(
        skipLoadingOnRefresh: true,
        skipLoadingOnReload: true,
        data: (data) => _buildContent(context, ref, data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildError(context, ref, error),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    StatisticsState state,
  ) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Accuracy Card
            if (state.totalAccuracy != null)
              _buildTotalAccuracyCard(context, state.totalAccuracy!),

            const SizedBox(height: 24),

            // Top 5 Strongest Topics
            if (state.top5StrongTopics.isNotEmpty) ...[
              _buildSectionHeader(context, '⭐ Top 5 Migliori', Colors.green),
              const SizedBox(height: 12),
              ...state.top5StrongTopics.map(
                  (topic) => _buildTopicAccuracyCard(context, topic, true)),
            ],

            const SizedBox(height: 24),

            // Top 5 Weakest Topics
            if (state.top5WeakTopics.isNotEmpty) ...[
              _buildSectionHeader(
                  context, '📈 Top 5 da Migliorare', Colors.orange),
              const SizedBox(height: 12),
              ...state.top5WeakTopics.map(
                  (topic) => _buildTopicAccuracyCard(context, topic, false)),
            ],

            const SizedBox(height: 24),

            // Recent Quizzes
            _buildSectionHeader(
              context,
              '📋 Quiz Recenti',
              Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            RecentQuizzesSection(scores: state.recentScores),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalAccuracyCard(
      BuildContext context, TotalAccuracy totalAccuracy) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.tertiaryContainer,
            theme.colorScheme.primaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.trending_up_rounded,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Precisione Globale',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                    Text(
                      'Analizza le tue performance complessive',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onTertiaryContainer
                            .withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            spacing: 4,
            children: [
              Expanded(
                child: _buildStatPreview(
                  context,
                  'Totali',
                  '${totalAccuracy.totalAnswers}',
                  Icons.quiz_rounded,
                  Colors.blue,
                ),
              ),
              Expanded(
                child: _buildStatPreview(
                  context,
                  'Corrette',
                  '${totalAccuracy.correctAnswers}',
                  Icons.check_circle_rounded,
                  Colors.green,
                ),
              ),
              Expanded(
                child: _buildStatPreview(
                  context,
                  'Sbagliate',
                  '${totalAccuracy.wrongAnswers}',
                  Icons.close_rounded,
                  Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Progress Bar with percentage
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (totalAccuracy.accuracyPercent >= 70
                        ? Colors.green
                        : Colors.orange)
                    .withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Precisione',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      '${totalAccuracy.accuracyPercent.toStringAsFixed(1)}%',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: totalAccuracy.accuracyPercent >= 70
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: totalAccuracy.accuracyPercent / 100,
                    minHeight: 16,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      totalAccuracy.accuracyPercent >= 70
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatPreview(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTopicAccuracyCard(
      BuildContext context, TopicAccuracy topic, bool isStrong) {
    final color = isStrong ? Colors.green : Colors.orange;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: color.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isStrong ? Icons.star_rounded : Icons.trending_down_rounded,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${topic.totalAnswers} risposte totali',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.6),
                        ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${topic.accuracyPercent.toStringAsFixed(1)}%',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      '${topic.correctAnswers}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    const Text(' / '),
                    Text(
                      '${topic.wrongAnswers}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Object error) {
    return Center(
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
            'Errore nel caricamento',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7),
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ref.read(statisticsControllerProvider.notifier).refresh();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Riprova'),
          ),
        ],
      ),
    );
  }
}
