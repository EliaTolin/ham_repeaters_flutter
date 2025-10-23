import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/controller/quiz_statistics_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/widgets/accuracy_chart_widget.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/widgets/overview_stats_card.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/widgets/performance_trends_widget.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/widgets/recent_quizzes_list.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/statistics/widgets/statistics_header.dart';

@RoutePage()
class QuizStatisticsPage extends ConsumerWidget {
  const QuizStatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticsAsync = ref.watch(quizStatisticsControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Header with gradient and animations
          const SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: StatisticsHeader(),
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          // Statistics content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: statisticsAsync.when(
              data: (scores) {
                if (scores.isEmpty) {
                  return SliverToBoxAdapter(
                    child: _buildEmptyState(context),
                  );
                }

                return SliverList(
                  delegate: SliverChildListDelegate([
                    // Overview statistics
                    OverviewStatsCard(scores: scores),
                    const SizedBox(height: 24),

                    // Accuracy chart
                    AccuracyChartWidget(scores: scores),
                    const SizedBox(height: 24),

                    // Performance trends
                    PerformanceTrendsWidget(scores: scores),
                    const SizedBox(height: 24),

                    // Recent quizzes list
                    RecentQuizzesList(scores: scores),
                    const SizedBox(height: 32),
                  ]),
                );
              },
              loading: () => SliverToBoxAdapter(
                child: _buildLoadingState(context),
              ),
              error: (error, stack) => SliverToBoxAdapter(
                child: _buildErrorState(context, error, ref),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 24),
          Text(
            'Nessuna Statistica Disponibile',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Completa alcuni quiz per vedere le tue statistiche e i tuoi progressi!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to quiz selection
              context.router.maybePop();
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text('Inizia un Quiz'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Caricamento statistiche...',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Errore nel caricamento',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ref.invalidate(quizStatisticsControllerProvider);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Riprova'),
          ),
        ],
      ),
    );
  }
}
