import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class AccuracyChartWidget extends StatefulWidget {
  const AccuracyChartWidget({
    required this.scores,
    super.key,
  });

  final List<QuizSetScore> scores;

  @override
  State<AccuracyChartWidget> createState() => _AccuracyChartWidgetState();
}

class _AccuracyChartWidgetState extends State<AccuracyChartWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

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

    // Calculate average accuracy
    final averageAccuracy = widget.scores.fold<double>(0, (sum, score) => sum + score.accuracyPct) /
        widget.scores.length;

    // Get recent scores for trend
    final recentScores = widget.scores.take(10).toList();
    final trend = _calculateTrend(recentScores);

    return AnimatedBuilder(
      animation: _progressAnimation,
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
                    Icons.show_chart_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Precisione e Tendenze',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildTrendIndicator(trend),
                ],
              ),
              const SizedBox(height: 24),

              // Circular progress chart
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: _progressAnimation.value * (averageAccuracy / 100),
                        strokeWidth: 12,
                        backgroundColor: theme.colorScheme.outline.withValues(alpha: 0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getAccuracyColor(averageAccuracy),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '${(averageAccuracy * _progressAnimation.value).toStringAsFixed(1)}%',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _getAccuracyColor(averageAccuracy),
                          ),
                        ),
                        Text(
                          'Precisione Media',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Accuracy distribution
              _buildAccuracyDistribution(recentScores),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTrendIndicator(double trend) {
    final isPositive = trend > 0;
    final isNeutral = trend == 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPositive
            ? Colors.green.withValues(alpha: 0.1)
            : isNeutral
                ? Colors.grey.withValues(alpha: 0.1)
                : Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive
                ? Icons.trending_up
                : isNeutral
                    ? Icons.trending_flat
                    : Icons.trending_down,
            size: 16,
            color: isPositive
                ? Colors.green
                : isNeutral
                    ? Colors.grey
                    : Colors.red,
          ),
          const SizedBox(width: 4),
          Text(
            isPositive
                ? 'In Crescita'
                : isNeutral
                    ? 'Stabile'
                    : 'In Calo',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isPositive
                  ? Colors.green
                  : isNeutral
                      ? Colors.grey
                      : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccuracyDistribution(List<QuizSetScore> scores) {
    final theme = Theme.of(context);

    // Group scores by accuracy ranges
    final ranges = <String, int>{
      '90-100%': 0,
      '80-89%': 0,
      '70-79%': 0,
      '60-69%': 0,
      '0-59%': 0,
    };

    for (final score in scores) {
      if (score.accuracyPct >= 90) {
        ranges['90-100%'] = ranges['90-100%']! + 1;
      } else if (score.accuracyPct >= 80) {
        ranges['80-89%'] = ranges['80-89%']! + 1;
      } else if (score.accuracyPct >= 70) {
        ranges['70-79%'] = ranges['70-79%']! + 1;
      } else if (score.accuracyPct >= 60) {
        ranges['60-69%'] = ranges['60-69%']! + 1;
      } else {
        ranges['0-59%'] = ranges['0-59%']! + 1;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Distribuzione Precisione',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...ranges.entries.map((entry) {
          final percentage = scores.isEmpty ? 0.0 : (entry.value / scores.length) * 100;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    entry.key,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: _progressAnimation.value * (percentage / 100),
                    backgroundColor: theme.colorScheme.outline.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getRangeColor(entry.key),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(percentage * _progressAnimation.value).toStringAsFixed(0)}%',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Color _getAccuracyColor(double accuracy) {
    if (accuracy >= 90) return Colors.green;
    if (accuracy >= 80) return Colors.lightGreen;
    if (accuracy >= 70) return Colors.orange;
    if (accuracy >= 60) return Colors.deepOrange;
    return Colors.red;
  }

  Color _getRangeColor(String range) {
    switch (range) {
      case '90-100%':
        return Colors.green;
      case '80-89%':
        return Colors.lightGreen;
      case '70-79%':
        return Colors.orange;
      case '60-69%':
        return Colors.deepOrange;
      default:
        return Colors.red;
    }
  }

  double _calculateTrend(List<QuizSetScore> scores) {
    if (scores.length < 2) return 0;

    final recent = scores.take(5).fold<double>(0, (sum, score) => sum + score.accuracyPct) / 5;
    final older =
        scores.skip(5).take(5).fold<double>(0, (sum, score) => sum + score.accuracyPct) / 5;

    return recent - older;
  }
}
