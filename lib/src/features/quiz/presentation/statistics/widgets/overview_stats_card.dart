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

    // Calcola il numero di tipologie d'esame per le animazioni
    final examTypes = _getExamTypes();
    _animations = List.generate(examTypes.length, (index) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOutCubic,
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
    final examTypes = _getExamTypes();

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
                    Icons.analytics_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Precisione per Tipologia',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (examTypes.isEmpty)
                _buildEmptyState(theme)
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: examTypes.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final examType = examTypes[index];
                    final accuracy = _getAverageAccuracyForExamType(examType);
                    final color = _getAccuracyColor(accuracy);

                    return Transform.scale(
                      scale: _animations[index].value,
                      child: _buildExamTypeCard(theme, examType, accuracy, color),
                    );
                  },
                ),
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
            'Nessun quiz completato',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Completa alcuni quiz per vedere le statistiche per tipologia',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildExamTypeCard(ThemeData theme, String examType, double accuracy, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icona della tipologia
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getExamTypeIcon(examType),
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),

          // Informazioni
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quiz $examType',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Precisione media',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),

          // Percentuale con progress ring
          Column(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 1,
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    CircularProgressIndicator(
                      value: accuracy / 100,
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                    Text(
                      '${accuracy.toStringAsFixed(0)}%',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _getExamTypes() {
    final examTypes = <String>{};
    for (final score in widget.scores) {
      if (score.exam != null) {
        examTypes.add(score.exam!.value);
      } else {
        examTypes.add('Personalizzato');
      }
    }
    return examTypes.toList()..sort();
  }

  double _getAverageAccuracyForExamType(String examType) {
    final scoresForType = widget.scores.where((score) {
      if (examType == 'Personalizzato') {
        return score.exam == null;
      }
      return score.exam?.value == examType;
    }).toList();

    if (scoresForType.isEmpty) return 0;

    final totalAccuracy = scoresForType.fold<double>(
      0,
      (sum, score) => sum + score.accuracyPct,
    );

    return totalAccuracy / scoresForType.length;
  }

  Color _getAccuracyColor(double accuracy) {
    if (accuracy >= 90) return Colors.green;
    if (accuracy >= 80) return Colors.lightGreen;
    if (accuracy >= 70) return Colors.orange;
    if (accuracy >= 60) return Colors.deepOrange;
    return Colors.red;
  }

  IconData _getExamTypeIcon(String examType) {
    switch (examType.toLowerCase()) {
      case 'completo':
        return Icons.quiz_rounded;
      case 'parziale':
        return Icons.quiz_outlined;
      case 'personalizzato':
        return Icons.tune_rounded;
      default:
        return Icons.quiz_rounded;
    }
  }
}
