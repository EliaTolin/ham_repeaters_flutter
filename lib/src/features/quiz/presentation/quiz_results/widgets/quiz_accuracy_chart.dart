import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class QuizAccuracyChart extends StatefulWidget {
  const QuizAccuracyChart({
    required this.score,
    super.key,
  });

  final QuizSetScore score;

  @override
  State<QuizAccuracyChart> createState() => _QuizAccuracyChartState();
}

class _QuizAccuracyChartState extends State<QuizAccuracyChart> with TickerProviderStateMixin {
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
      end: (widget.score.accuracyPct / 100).clamp(0.0, 1.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Start animation with delay
    Future.delayed(const Duration(milliseconds: 800), () {
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
    final accuracy = widget.score.accuracyPct;
    final isGoodScore = accuracy >= 70;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Precisione',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Circular progress indicator
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  // Background circle
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
                    ),
                  ),

                  // Progress circle
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: const Size(200, 200),
                        painter: CircularProgressPainter(
                          progress: _progressAnimation.value,
                          color: isGoodScore ? theme.colorScheme.primary : theme.colorScheme.error,
                          strokeWidth: 12,
                        ),
                      );
                    },
                  ),

                  // Center text
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (context, child) {
                            return Text(
                              '${(accuracy * _progressAnimation.value).toStringAsFixed(1)}%',
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isGoodScore
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.error,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Precisione',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Performance indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPerformanceIndicator(
                'Eccellente',
                '90-100%',
                Colors.green,
                accuracy >= 90,
              ),
              _buildPerformanceIndicator(
                'Buono',
                '70-89%',
                Colors.blue,
                accuracy >= 70 && accuracy < 90,
              ),
              _buildPerformanceIndicator(
                'Sufficiente',
                '60-69%',
                Colors.orange,
                accuracy >= 60 && accuracy < 70,
              ),
              _buildPerformanceIndicator(
                'Da migliorare',
                '<60%',
                Colors.red,
                accuracy < 60,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceIndicator(
    String label,
    String range,
    Color color,
    bool isActive,
  ) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isActive ? color : color.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          range,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? color : theme.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isActive ? color : theme.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });
  final double progress;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -90 * (3.14159 / 180); // Start from top
    final sweepAngle = 2 * 3.14159 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
