import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class QuizStatisticsCard extends StatefulWidget {
  const QuizStatisticsCard({
    required this.score,
    super.key,
  });

  final QuizSetScore score;

  @override
  State<QuizStatisticsCard> createState() => _QuizStatisticsCardState();
}

class _QuizStatisticsCardState extends State<QuizStatisticsCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Create staggered animations for each stat
    _animations = List.generate(4, (index) {
      final start = index * 0.2;
      final end = (start + 0.4).clamp(0.0, 1.0);
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            start,
            end,
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    });

    // Start animation with delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistiche',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Statistics grid
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Risposte',
                  '${widget.score.answered}/${widget.score.total}',
                  Icons.quiz,
                  theme.colorScheme.primary,
                  0,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  'Corrette',
                  '${widget.score.correct}',
                  Icons.check_circle,
                  Colors.green,
                  1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Sbagliate',
                  '${widget.score.wrong}',
                  Icons.cancel,
                  Colors.red,
                  2,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  'Precisione',
                  '${widget.score.accuracyPct.toStringAsFixed(1)}%',
                  Icons.trending_up,
                  _getAccuracyColor(widget.score.accuracyPct),
                  3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
    int animationIndex,
  ) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animations[animationIndex],
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - _animations[animationIndex].value)),
          child: Opacity(
            opacity: _animations[animationIndex].value,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getAccuracyColor(double accuracy) {
    if (accuracy >= 80) return Colors.green;
    if (accuracy >= 60) return Colors.orange;
    return Colors.red;
  }
}
