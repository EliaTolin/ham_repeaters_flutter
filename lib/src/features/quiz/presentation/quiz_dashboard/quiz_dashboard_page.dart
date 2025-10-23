import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/common/widgets/loading/circular_loading_widget.dart';
import 'package:quiz_radioamatori/resources/resources.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/controller/quiz_dashboard_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/widgets/quick_actions_section.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/widgets/recent_quizzes_section.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/widgets/statistics_preview_section.dart';

@RoutePage()
class QuizDashboardPage extends HookConsumerWidget {
  const QuizDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(quizDashboardControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Header with gradient and welcome message
          SliverAppBar(
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Image(
                                image: AssetImage(ImageAssets.icon),
                                width: 64,
                                height: 64,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Benvenuto,',
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Pronto per allenarti con i quiz?',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withValues(alpha: 0.9),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          // Main content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Quick actions section
                const QuickActionsSection(),
                const SizedBox(height: 24),
                // Statistics preview section
                dashboardAsync.when(
                  data: (state) => StatisticsPreviewSection(
                    totalQuizzes: state.totalQuizzes,
                    averageAccuracy: state.averageAccuracy,
                  ),
                  loading: () => const CircularLoadingWidget(),
                  error: (error, stack) => _buildErrorSection(context, error, ref),
                ),
                const SizedBox(height: 24),

                // Recent quizzes section
                dashboardAsync.when(
                  data: (state) => RecentQuizzesSection(scores: state.recentScores ?? []),
                  loading: _buildLoadingSection,
                  error: (error, stack) => _buildErrorSection(context, error, ref),
                ),

                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildLoadingSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: const Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Caricamento quiz recenti...'),
        ],
      ),
    );
  }

  static Widget _buildErrorSection(BuildContext context, Object error, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Errore nel caricamento',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ref.invalidate(quizDashboardControllerProvider);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Riprova'),
          ),
        ],
      ),
    );
  }
}
