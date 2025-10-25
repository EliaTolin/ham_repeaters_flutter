import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';
import 'package:share_plus/share_plus.dart';

class QuizActionButtons extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      spacing: 16,
      children: [
        // Primary action button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: onRetakeQuiz,
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
        SizedBox(
          width: double.infinity,
          height: 72,
          child: ElevatedButton.icon(
            onPressed: onViewDetails,
            icon: const Icon(Icons.insights_outlined),
            label: const Text('Visualizza risposte'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.teal.shade50,
              foregroundColor: Colors.teal,
              elevation: 8,
              shadowColor: Colors.teal.withValues(alpha: 0.3),
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
              child: // Primary action button
                  SizedBox(
                width: double.infinity,
                height: 86,
                child: ElevatedButton.icon(
                  onPressed: onBackToHome,
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
            ),

            // WhatsApp share button
            Expanded(
              child: SizedBox(
                height: 86,
                child: ElevatedButton.icon(
                  onPressed: () => _shareMessage(context),
                  icon: const Icon(Icons.share, color: Colors.white),
                  label: const Text(
                    'Condividi risultato',
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
    );
  }

  void _shareMessage(BuildContext context) {
    final score = this.score;

    // Crea il messaggio da condividere
    final message = _createShareMessage(score);

    // Apre il menu di condivisione del dispositivo
    SharePlus.instance.share(
      ShareParams(
        subject: 'Il mio punteggio!',
        text: message,
      ),
    );
  }

  String _createShareMessage(QuizSetScore score) {
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
$performanceEmoji *QUIZ RADIOAMATORI APP* $performanceEmoji

📊 *Esame:* $examType
🎮 *Modalità:* $mode
✅ *Risposte corrette:* $correct/$total
📈 *Precisione:* $accuracy%

${_getMotivationalMessage(score.accuracyPct)}

📱 *Allenati anche tu con Quiz Radioamatori!*
L'app perfetta per preparare l'esame di radioamatore con migliaia di domande e quiz personalizzati.
Scarica l'app su iOS e Android.
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
