import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class PerformanceTrendsWidget extends StatefulWidget {
  const PerformanceTrendsWidget({
    required this.scores,
    super.key,
  });

  final List<QuizSetScore> scores;

  @override
  State<PerformanceTrendsWidget> createState() => _PerformanceTrendsWidgetState();
}

class _PerformanceTrendsWidgetState extends State<PerformanceTrendsWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
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

    // Get recent scores for trend analysis
    final recentScores = widget.scores.take(10).toList();
    final trends = _calculateTrends(recentScores);

    return AnimatedBuilder(
      animation: _fadeAnimation,
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
                    Icons.trending_up_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Tendenze di Performance',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Performance metrics
              Row(
                children: [
                  Expanded(
                    child: _buildTrendCard(
                      context,
                      'Precisione',
                      trends['accuracy']!,
                      Icons.gps_fixed,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTrendCard(
                      context,
                      'Velocità',
                      trends['speed']!,
                      Icons.speed,
                      Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildTrendCard(
                      context,
                      'Consistenza',
                      trends['consistency']!,
                      Icons.timeline,
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTrendCard(
                      context,
                      'Miglioramento',
                      trends['improvement']!,
                      Icons.trending_up,
                      Colors.purple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Performance chart
              _buildPerformanceChart(recentScores),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTrendCard(
    BuildContext context,
    String title,
    double value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    final isPositive = value > 0;
    final isNeutral = value == 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
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
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                '${value.toStringAsFixed(1)}%',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isPositive
                      ? Colors.green
                      : isNeutral
                          ? Colors.grey
                          : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceChart(List<QuizSetScore> scores) {
    final theme = Theme.of(context);

    if (scores.length < 2) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Dati insufficienti per il grafico',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomPaint(
        painter: PerformanceChartPainter(
          scores: scores,
          animationValue: _fadeAnimation.value,
        ),
        child: Container(),
      ),
    );
  }

  Map<String, double> _calculateTrends(List<QuizSetScore> scores) {
    if (scores.length < 2) {
      return {
        'accuracy': 0.0,
        'speed': 0.0,
        'consistency': 0.0,
        'improvement': 0.0,
      };
    }

    // Calculate accuracy trend
    final recentAccuracy =
        scores.take(5).fold<double>(0, (sum, score) => sum + score.accuracyPct) / 5;
    final olderAccuracy =
        scores.skip(5).take(5).fold<double>(0, (sum, score) => sum + score.accuracyPct) / 5;
    final accuracyTrend = recentAccuracy - olderAccuracy;

    // Calculate speed trend (based on completion rate)
    final recentSpeed =
        scores.take(5).fold<double>(0, (sum, score) => sum + (score.answered / score.total)) / 5;
    final olderSpeed = scores
            .skip(5)
            .take(5)
            .fold<double>(0, (sum, score) => sum + (score.answered / score.total)) /
        5;
    final speedTrend = (recentSpeed - olderSpeed) * 100;

    // Calculate consistency (standard deviation)
    final accuracyValues = scores.map((s) => s.accuracyPct).toList();
    final mean = accuracyValues.reduce((a, b) => a + b) / accuracyValues.length;
    final variance = accuracyValues.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) /
        accuracyValues.length;
    final consistency = 100 - (variance / 10); // Higher is more consistent

    // Calculate improvement (overall trend)
    final improvement = accuracyTrend;

    return {
      'accuracy': accuracyTrend,
      'speed': speedTrend,
      'consistency': consistency.clamp(0, 100),
      'improvement': improvement,
    };
  }
}

class PerformanceChartPainter extends CustomPainter {
  PerformanceChartPainter({
    required this.scores,
    required this.animationValue,
  });
  final List<QuizSetScore> scores;
  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    if (scores.length < 2) return;

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final points = <Offset>[];

    // Calculate points
    for (var i = 0; i < scores.length; i++) {
      final x = (i / (scores.length - 1)) * size.width;
      final y = size.height - (scores[i].accuracyPct / 100) * size.height;
      points.add(Offset(x, y));
    }

    // Draw line
    if (points.isNotEmpty) {
      path.moveTo(points.first.dx, points.first.dy);
      for (var i = 1; i < points.length; i++) {
        final currentPoint = points[i];
        final animatedY = points.first.dy + (currentPoint.dy - points.first.dy) * animationValue;
        path.lineTo(currentPoint.dx, animatedY);
      }
    }

    canvas.drawPath(path, paint);

    // Draw points
    final pointPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (final point in points) {
      final animatedY = points.first.dy + (point.dy - points.first.dy) * animationValue;
      canvas.drawCircle(Offset(point.dx, animatedY), 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
