import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ham_repeaters/src/features/quiz/domain/quiz_set_score/quiz_set_score.dart';

class QuizResultsHeader extends StatefulWidget {
  const QuizResultsHeader({
    required this.score,
    this.onBackPressed,
    this.onDeletePressed,
    super.key,
  });

  final QuizSetScore score;
  final VoidCallback? onBackPressed;
  final VoidCallback? onDeletePressed;
  @override
  State<QuizResultsHeader> createState() => _QuizResultsHeaderState();
}

class _QuizResultsHeaderState extends State<QuizResultsHeader>
    with TickerProviderStateMixin {
  late AnimationController _celebrationController;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _celebrationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _celebrationController,
        curve: Curves.elasticOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _celebrationController.forward();
    });
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isGoodScore = widget.score.accuracyPct >= 70;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(54),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isGoodScore
              ? [
                  theme.colorScheme.primary.withValues(alpha: 0.1),
                  theme.colorScheme.secondary.withValues(alpha: 0.05),
                ]
              : [
                  theme.colorScheme.error.withValues(alpha: 0.1),
                  theme.colorScheme.error.withValues(alpha: 0.05),
                ],
        ),
      ),
      child: Column(
        children: [
          // Back button and title
          Row(
            children: [
              if (widget.onBackPressed != null && context.router.canPop())
                IconButton(
                  onPressed: widget.onBackPressed,
                  icon: const Icon(Icons.arrow_back_ios),
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    foregroundColor: theme.colorScheme.onSurface,
                  ),
                ),
              const SizedBox(width: 16),
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Risultati Quiz',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (widget.onDeletePressed != null)
                IconButton(
                  onPressed: widget.onDeletePressed,
                  icon: const Icon(Icons.delete),
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.error,
                    foregroundColor: theme.colorScheme.onError,
                  ),
                ),
            ],
          ),

          const SizedBox(height: 32),

          // Celebration icon and score
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: isGoodScore
                      ? [
                          theme.colorScheme.primary.withValues(alpha: 0.2),
                          theme.colorScheme.primary.withValues(alpha: 0.1),
                        ]
                      : [
                          theme.colorScheme.error.withValues(alpha: 0.2),
                          theme.colorScheme.error.withValues(alpha: 0.1),
                        ],
                ),
              ),
              child: Center(
                child: Icon(
                  isGoodScore
                      ? Icons.celebration
                      : Icons.sentiment_dissatisfied,
                  size: 48,
                  color: isGoodScore
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Score display
          FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                Text(
                  '${widget.score.accuracyPct.toStringAsFixed(1)}%',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isGoodScore
                        ? theme.colorScheme.primary
                        : theme.colorScheme.error,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getScoreMessage(widget.score.accuracyPct),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getScoreMessage(double accuracy) {
    if (accuracy >= 90) return 'Eccellente! 🎉';
    if (accuracy >= 80) return 'Ottimo lavoro! 👏';
    if (accuracy >= 70) return 'Buono! 👍';
    if (accuracy >= 60) return 'Sufficiente! 📚';
    return 'Continua a studiare! 💪';
  }
}
