import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/src/features/quiz/data/model/quiz_set_question_result_model.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/quiz_answers_provider.dart';

@RoutePage()
class QuizAnswersPage extends HookConsumerWidget {
  const QuizAnswersPage({required this.setId, super.key});
  final String setId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answersAsync = ref.watch(quizAnswersProvider(setId));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.primary),
          onPressed: () => context.router.pop(),
        ),
        title: Text(
          'Dettaglio Risposte',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: answersAsync.when(
        data: (answers) {
          if (answers.isEmpty) {
            return const Center(
              child: Text('Nessuna risposta trovata'),
            );
          }

          final correctCount = answers.where((a) => a.isCorrect).length;
          final totalCount = answers.length;
          final accuracy = (correctCount / totalCount * 100).round();

          return Column(
            children: [
              // Summary Card
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          context,
                          'Corrette',
                          correctCount.toString(),
                          Colors.green,
                          Icons.check_circle,
                        ),
                        _buildStatItem(
                          context,
                          'Sbagliate',
                          (totalCount - correctCount).toString(),
                          Colors.red,
                          Icons.cancel,
                        ),
                        _buildStatItem(
                          context,
                          'Precisione',
                          '$accuracy%',
                          Theme.of(context).colorScheme.primary,
                          Icons.percent,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Risultato del Quiz',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                    ),
                  ],
                ),
              ),

              // Answers List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    final answer = answers[index];
                    return _buildAnswerItem(context, answer, index + 1);
                  },
                ),
              ),
            ],
          );
        },
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Caricamento risposte...',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
              ),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Errore nel caricamento delle risposte',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  Widget _buildAnswerItem(
    BuildContext context,
    QuizSetQuestionResultModel answer,
    int questionNumber,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: answer.isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: answer.isCorrect ? Colors.green.shade200 : Colors.red.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: (answer.isCorrect ? Colors.green : Colors.red).withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Question Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: answer.isCorrect ? Colors.green.shade100 : Colors.red.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: answer.isCorrect ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Domanda $questionNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  answer.isCorrect ? Icons.check_circle : Icons.cancel,
                  color: answer.isCorrect ? Colors.green : Colors.red,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  answer.isCorrect ? 'Corretta' : 'Sbagliata',
                  style: TextStyle(
                    color: answer.isCorrect ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Answer Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Topic and Exam Info
                Row(
                  children: [
                    Icon(
                      Icons.topic,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      answer.topicName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.quiz,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      answer.exam,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Question Text (if available)
                if (answer.questionText != null && answer.questionText!.isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Domanda:',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          answer.questionText!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Your Answer
                _buildAnswerTile(
                  context,
                  'La tua risposta',
                  answer.chosenAnswer ?? 'Non risposta',
                  answer.isCorrect ? Colors.green : Colors.red,
                  answer.isCorrect ? Icons.check : Icons.close,
                ),

                // Correct Answer (only if wrong)
                if (!answer.isCorrect) ...[
                  const SizedBox(height: 12),
                  _buildAnswerTile(
                    context,
                    'Risposta corretta',
                    answer.correctAnswer ?? 'N/A',
                    Colors.blue,
                    Icons.lightbulb,
                  ),
                ],

                const SizedBox(height: 16),

                // Time and Date
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Tempo: ${(answer.timeMs / 1000).toStringAsFixed(1)}s',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                    const Spacer(),
                    Text(
                      _formatDate(answer.answeredAt),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerTile(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }
}
