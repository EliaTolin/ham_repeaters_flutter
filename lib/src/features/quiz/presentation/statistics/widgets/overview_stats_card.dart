import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class OverviewStatsCard extends StatefulWidget {
  const OverviewStatsCard({
    required this.scores,
    super.key,
  });

  final List<QuizSetScore> scores;

  @override
  State<OverviewStatsCard> createState() => _OverviewStatsCardState();
}

class _OverviewStatsCardState extends State<OverviewStatsCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animations = List.generate(4, (index) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.2,
            (index * 0.2) + 0.6,
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Calculate statistics
    final totalQuizzes = widget.scores.length;
    final totalQuestions = widget.scores.fold(0, (sum, score) => sum + score.total);
    final averageAccuracy =
        widget.scores.fold<double>(0, (sum, score) => sum + score.accuracyPct) / totalQuizzes;
    final bestScore = widget.scores
        .fold<double>(0, (max, score) => score.accuracyPct > max ? score.accuracyPct : max);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primaryContainer,
                theme.colorScheme.secondaryContainer,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.dashboard_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Riepilogo Generale',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildStatItem(
                    context,
                    'Quiz Completati',
                    totalQuizzes.toString(),
                    Icons.quiz_rounded,
                    Colors.blue,
                    0,
                  ),
                  _buildStatItem(
                    context,
                    'Domande Totali',
                    totalQuestions.toString(),
                    Icons.help_outline_rounded,
                    Colors.green,
                    1,
                  ),
                  _buildStatItem(
                    context,
                    'Precisione Media',
                    '${averageAccuracy.toStringAsFixed(1)}%',
                    Icons.trending_up_rounded,
                    Colors.orange,
                    2,
                  ),
                  _buildStatItem(
                    context,
                    'Miglior Risultato',
                    '${bestScore.toStringAsFixed(1)}%',
                    Icons.emoji_events_rounded,
                    Colors.purple,
                    3,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
    int animationIndex,
  ) {
    final theme = Theme.of(context);

    return Transform.scale(
      scale: _animations[animationIndex].value,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ),
                const Spacer(),
                Text(
                  value,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
