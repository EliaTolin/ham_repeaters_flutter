import 'package:flutter/material.dart';

class QuizActionButtons extends StatefulWidget {
  const QuizActionButtons({
    required this.onRetakeQuiz,
    required this.onViewDetails,
    super.key,
  });

  final VoidCallback onRetakeQuiz;
  final VoidCallback onViewDetails;

  @override
  State<QuizActionButtons> createState() => _QuizActionButtonsState();
}

class _QuizActionButtonsState extends State<QuizActionButtons> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    // Start animation with delay
    Future.delayed(const Duration(milliseconds: 1000), () {
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

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Column(
            children: [
              // Primary action button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: widget.onRetakeQuiz,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Riprova Quiz'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    elevation: 8,
                    shadowColor: theme.colorScheme.primary.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Secondary action button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: widget.onViewDetails,
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Dettagli Risultati'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    side: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Additional options
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      icon: Icons.share,
                      label: 'Condividi',
                      onPressed: () {
                        // TODO: Implement share functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Funzionalità di condivisione in arrivo!'),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionButton(
                      icon: Icons.download,
                      label: 'Esporta',
                      onPressed: () {
                        // TODO: Implement export functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Funzionalità di esportazione in arrivo!'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.onSurface.withOpacity(0.7),
          side: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.3),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
