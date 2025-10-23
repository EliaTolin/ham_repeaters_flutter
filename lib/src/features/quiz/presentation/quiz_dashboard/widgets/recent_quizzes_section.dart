import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class RecentQuizzesSection extends HookWidget {
  const RecentQuizzesSection({required this.scores, super.key});

  final List<QuizSetScore> scores;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );

    final slideAnimations = useMemoized(
      () {
        return List.generate(
          scores.length.clamp(0, 3),
          (index) => Tween<Offset>(
            begin: const Offset(0, 0.5),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval(
                index * 0.1,
                (index * 0.1) + 0.6,
                curve: Curves.easeOutCubic,
              ),
            ),
          ),
        );
      },
      [scores.length],
    );

    useEffect(
      () {
        animationController.forward();
        return null;
      },
      [],
    );

    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withValues(alpha: 0.1),
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
                    Icons.history_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Quiz recenti',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  if (scores.isNotEmpty)
                    Text(
                      '${scores.length} quiz',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              if (scores.isEmpty)
                _buildEmptyState(theme)
              else
                ...scores.asMap().entries.map((entry) {
                  final index = entry.key;
                  final score = entry.value;

                  return SlideTransition(
                    position: slideAnimations[index],
                    child: _buildQuizCard(theme, score, index),
                  );
                }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.quiz_outlined,
            size: 48,
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'Nessun quiz recente',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Completa il tuo primo quiz per vederlo qui!',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuizCard(ThemeData theme, QuizSetScore score, int index) {
    final examType = score.exam?.value ?? 'Personalizzato';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quiz $examType',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${score.correct}/${score.total} risposte corrette',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          // Accuracy display
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getAccuracyColor(score.accuracyPct).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${score.accuracyPct.toStringAsFixed(1)}%',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _getAccuracyColor(score.accuracyPct),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getAccuracyColor(double accuracy) {
    if (accuracy >= 90) return Colors.green;
    if (accuracy >= 80) return Colors.lightGreen;
    if (accuracy >= 70) return Colors.orange;
    if (accuracy >= 60) return Colors.deepOrange;
    return Colors.red;
  }
}
