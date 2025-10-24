import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class QuizActionButtons extends StatefulWidget {
  const QuizActionButtons({
    required this.onRetakeQuiz,
    required this.onViewDetails,
    required this.onBackToHome,
    required this.score,
    super.key,
  });

  final VoidCallback onRetakeQuiz;
  final VoidCallback onViewDetails;
  final VoidCallback onBackToHome;
  final QuizSetScore score;

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
            spacing: 16,
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
                    shadowColor: theme.colorScheme.primary.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              // Primary action button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: widget.onBackToHome,
                  icon: const Icon(Icons.home),
                  label: const Text('Torna alla Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    foregroundColor: theme.colorScheme.onSecondary,
                    elevation: 8,
                    shadowColor: theme.colorScheme.secondary.withValues(alpha: 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              // Secondary action button
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 72,
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
                  ),
                  // WhatsApp share button
                  Expanded(
                    child: SizedBox(
                      height: 72,
                      child: ElevatedButton.icon(
                        onPressed: () => _shareToWhatsApp(context),
                        icon: const Icon(Icons.message, color: Colors.white),
                        label: const Text(
                          'Condividi su WhatsApp',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF25D366), // WhatsApp green
                          elevation: 8,
                          shadowColor: const Color(0xFF25D366).withValues(alpha: 0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
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

  void _shareToWhatsApp(BuildContext context) {
    final score = widget.score;

    // Create a beautiful message for WhatsApp
    final message = _createWhatsAppMessage(score);

    // Copy to clipboard
    Clipboard.setData(ClipboardData(text: message));

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Messaggio copiato negli appunti! Apri WhatsApp per condividerlo.'),
          ],
        ),
        backgroundColor: const Color(0xFF25D366),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  String _createWhatsAppMessage(QuizSetScore score) {
    final examType = score.exam?.value ?? 'Personalizzato';
    final mode = score.mode.value;
    final accuracy = score.accuracyPct.toStringAsFixed(1);
    final correct = score.correct;
    final total = score.total;

    // Create emoji based on performance
    String performanceEmoji;
    if (score.accuracyPct >= 90) {
      performanceEmoji = '🏆';
    } else if (score.accuracyPct >= 70) {
      performanceEmoji = '🎯';
    } else if (score.accuracyPct >= 50) {
      performanceEmoji = '📚';
    } else {
      performanceEmoji = '💪';
    }

    return '''
$performanceEmoji *RISULTATO QUIZ RADIOAMATORI* $performanceEmoji

📊 *Esame:* $examType
🎮 *Modalità:* $mode
✅ *Risposte corrette:* $correct/$total
📈 *Precisione:* $accuracy%

${_getMotivationalMessage(score.accuracyPct)}

📱 *Allenati anche tu con Quiz Radioamatori!*
L'app perfetta per preparare l'esame di radioamatore con migliaia di domande e quiz personalizzati.

#QuizRadioamatori #Radioamatore #Esame #Preparazione
''';
  }

  String _getMotivationalMessage(double accuracy) {
    if (accuracy >= 95) {
      return "🌟 Eccellente! Sei pronto per l'esame!";
    } else if (accuracy >= 85) {
      return '🎉 Ottimo lavoro! Continua così!';
    } else if (accuracy >= 70) {
      return "👍 Buon risultato! Un po' di studio in più e sarai perfetto!";
    } else if (accuracy >= 50) {
      return '📖 Continua a studiare, stai migliorando!';
    } else {
      return '💪 Non mollare! Ogni quiz ti avvicina al successo!';
    }
  }
}
