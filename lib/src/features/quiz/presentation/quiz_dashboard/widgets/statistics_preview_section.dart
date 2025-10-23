import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quiz_radioamatori/router/app_router.dart';

class StatisticsPreviewSection extends HookWidget {
  const StatisticsPreviewSection({
    required this.totalQuizzes,
    required this.averageAccuracy,
    super.key,
  });

  final int totalQuizzes;
  final double averageAccuracy;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );

    final fadeAnimation = useMemoized(
      () {
        return Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.3, 1, curve: Curves.easeOut),
          ),
        );
      },
      [],
    );

    useEffect(
      () {
        animationController.forward();
        return null;
      },
      [],
    );

    final theme = Theme.of(context);

    return FadeTransition(
      opacity: fadeAnimation,
      child: Container(
        padding: const EdgeInsets.all(24),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    Icons.analytics_rounded,
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
                        'Le tue statistiche',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Analizza i tuoi progressi e migliora le performance',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onTertiaryContainer.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
    
            // Quick stats preview
            Row(
              children: [
                Expanded(
                  child: _buildStatPreview(
                    context,
                    'Quiz Completati',
                    totalQuizzes.toString(),
                    Icons.quiz_rounded,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatPreview(
                    context,
                    'Precisione Media',
                    '${averageAccuracy.toStringAsFixed(1)}%',
                    Icons.trending_up_rounded,
                    Colors.green,
                  ),
                ),
              ],
            ),
    
            const SizedBox(height: 24),
    
            // Action button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _navigateToStatistics(context),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Vedi tutte le Statistiche'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
            ),
          ],
        ),
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
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _navigateToStatistics(BuildContext context) {
    context.router.push(const QuizStatisticsRoute());
  }
}
