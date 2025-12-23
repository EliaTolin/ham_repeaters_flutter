import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ham_repeaters/common/widgets/logo_icon.dart';
import 'package:ham_repeaters/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';
import 'package:ham_repeaters/src/features/quiz/domain/exam_type.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_mode.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/controller/quiz_dashboard_controller.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/widgets/curated_sets_section.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/widgets/leaderboard_position_section.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/widgets/quick_actions_section.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/widgets/recent_quizzes_section.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/quiz_dashboard/widgets/statistics_preview_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.8),
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
                            const LogoIcon(),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Benvenuto,',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Pronto per allenarti con i quiz?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
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
                // Leaderboard position section (only for registered users)
                dashboardAsync.when(
                  data: (state) => LeaderboardPositionSection(
                      userPosition: state.userPosition),
                  loading: () => Skeletonizer(
                    child: LeaderboardPositionSection(
                      userPosition: _createMockLeaderboardEntry(),
                    ),
                  ),
                  error: (error, stack) =>
                      _buildErrorSection(context, error, ref),
                ),
                const SizedBox(height: 24),
                // Curated sets section (or empty info)
                dashboardAsync.when(
                  data: (state) {
                    final items = state.curatedSetsPreviews ?? const [];
                    return CuratedSetsSection(curatedSets: items);
                  },
                  loading: () => Skeletonizer(
                    child: CuratedSetsSection(
                        curatedSets: _createMockCuratedSets()),
                  ),
                  error: (error, stack) =>
                      _buildErrorSection(context, error, ref),
                ),

                const SizedBox(height: 32),
                // Statistics preview section
                dashboardAsync.when(
                  data: (state) => StatisticsPreviewSection(
                    totalQuizzes: state.totalQuizzes,
                    averageAccuracy: state.averageAccuracy,
                  ),
                  loading: () => const Skeletonizer(
                    child: StatisticsPreviewSection(
                      totalQuizzes: 42,
                      averageAccuracy: 75.5,
                    ),
                  ),
                  error: (error, stack) =>
                      _buildErrorSection(context, error, ref),
                ),
                const SizedBox(height: 24),

                // Recent quizzes section
                dashboardAsync.when(
                  data: (state) =>
                      RecentQuizzesSection(scores: state.recentScores ?? []),
                  loading: () => Skeletonizer(
                    child:
                        RecentQuizzesSection(scores: _createMockQuizScores()),
                  ),
                  error: (error, stack) =>
                      _buildErrorSection(context, error, ref),
                ),

                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // Mock data helpers
  List<CuratedSetPreview> _createMockCuratedSets() {
    final now = DateTime.now();
    return List.generate(
      3,
      (index) => CuratedSetPreview(
        id: 'mock-$index',
        title: 'Set Curato ${index + 1}',
        questionsCount: 20 + (index * 5),
        createdAt: now.subtract(Duration(days: index + 1)),
        updatedAt: now.subtract(Duration(days: index)),
        description: 'Descrizione del set curato numero ${index + 1}',
      ),
    );
  }

  List<QuizSetScore> _createMockQuizScores() {
    final now = DateTime.now();
    return List.generate(
      3,
      (index) => QuizSetScore(
        setId: 'mock-set-$index',
        userId: 'mock-user',
        mode: QuizMode.perEsame,
        answered: 10,
        correct: 7,
        wrong: 3,
        total: 30 + (index * 5),
        accuracyPct: 75.0 + (index * 5.0),
        exam: index.isEven ? ExamType.completo : ExamType.parziale,
        startedAt: now.subtract(Duration(days: index + 1)),
      ),
    );
  }

  LeaderboardEntry _createMockLeaderboardEntry() {
    return LeaderboardEntry(
      userId: 'mock-user',
      displayName: 'Utente Mock',
      propic: null,
      points: 1500,
      correctAnswers: 120,
      totalAnswers: 150,
      accuracyPercent: 80,
      lastAnsweredAt: DateTime.now().subtract(const Duration(hours: 2)),
      rank: 5,
    );
  }

  static Widget _buildErrorSection(
      BuildContext context, Object error, WidgetRef ref) {
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
