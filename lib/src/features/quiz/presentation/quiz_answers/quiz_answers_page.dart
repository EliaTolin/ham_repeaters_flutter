import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_question_result/quiz_set_question_result.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/topic/topic.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/get_topics/get_topics_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/provider/quiz_answers/quiz_answers_provider.dart';

@RoutePage()
class QuizAnswersPage extends HookConsumerWidget {
  const QuizAnswersPage({required this.setId, super.key});
  final String setId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answersAsync = ref.watch(quizAnswersProvider(setId));
    final topicsAsync = ref.watch(getTopicsProvider);

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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nessuna risposta trovata',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            );
          }

          return topicsAsync.when(
            data: (topics) => _AnswersList(
              answers: answers,
              topics: topics,
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => _AnswersList(
              answers: answers,
              topics: const [],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
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
                'Errore nel caricamento',
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
}

class _AnswersList extends StatefulWidget {
  const _AnswersList({
    required this.answers,
    required this.topics,
  });

  final List<QuizSetQuestionResult> answers;
  final List<Topic> topics;

  @override
  State<_AnswersList> createState() => _AnswersListState();
}

class _AnswersListState extends State<_AnswersList> {
  bool _showIncorrectFirst = true;

  List<QuizSetQuestionResult> get _sortedAnswers {
    final sorted = List<QuizSetQuestionResult>.from(widget.answers)
      ..sort((a, b) {
        if (_showIncorrectFirst) {
          // Prima sbagliate, poi corrette
          if (a.isCorrect && !b.isCorrect) return 1;
          if (!a.isCorrect && b.isCorrect) return -1;
        } else {
          // Prima corrette, poi sbagliate
          if (a.isCorrect && !b.isCorrect) return -1;
          if (!a.isCorrect && b.isCorrect) return 1;
        }
        return 0;
      });
    return sorted;
  }

  String _getTopicLabel(String topicName) {
    try {
      final topic = widget.topics.firstWhere((t) => t.name == topicName);
      return topic.label;
    } catch (e) {
      return topicName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortedAnswers = _sortedAnswers;

    return Column(
      children: [
        // Filter and stats bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            border: Border(
              bottom: BorderSide(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ordina per:',
                style: theme.textTheme.bodyMedium,
              ),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment<bool>(
                    value: true,
                    label: Text('Sbagliate'),
                    icon: Icon(Icons.priority_high, size: 16),
                  ),
                  ButtonSegment<bool>(
                    value: false,
                    label: Text('Corrette'),
                    icon: Icon(Icons.check_circle_outline, size: 16),
                  ),
                ],
                selected: {_showIncorrectFirst},
                onSelectionChanged: (Set<bool> selected) {
                  setState(() {
                    _showIncorrectFirst = selected.first;
                  });
                },
              ),
            ],
          ),
        ),

        // Answers List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedAnswers.length,
            itemBuilder: (context, index) {
              final answer = sortedAnswers[index];
              return _AnswerCard(
                answer: answer,
                questionNumber: index + 1,
                topicLabel: _getTopicLabel(answer.topicName),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AnswerCard extends StatelessWidget {
  const _AnswerCard({
    required this.answer,
    required this.questionNumber,
    required this.topicLabel,
  });

  final QuizSetQuestionResult answer;
  final int questionNumber;
  final String topicLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCorrect = answer.isCorrect;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCorrect
              ? theme.colorScheme.primary.withValues(alpha: 0.2)
              : theme.colorScheme.error.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (isCorrect ? theme.colorScheme.primary : theme.colorScheme.error)
                .withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isCorrect
                    ? [
                        theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
                        theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                      ]
                    : [
                        theme.colorScheme.errorContainer.withValues(alpha: 0.6),
                        theme.colorScheme.errorContainer.withValues(alpha: 0.3),
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isCorrect ? theme.colorScheme.primary : theme.colorScheme.error,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: (isCorrect ? theme.colorScheme.primary : theme.colorScheme.error)
                            .withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isCorrect ? Icons.check_circle : Icons.cancel,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Domanda $questionNumber',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Status text
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? theme.colorScheme.primary.withValues(alpha: 0.15)
                        : theme.colorScheme.error.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isCorrect ? 'Corretta' : 'Sbagliata',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isCorrect ? theme.colorScheme.primary : theme.colorScheme.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Topic badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    topicLabel,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Question text
                if (answer.questionText.isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Text(
                      answer.questionText,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Your answer
                _AnswerTile(
                  label: 'La tua risposta',
                  value: answer.chosenAnswer ?? 'Non risposta',
                  isCorrect: isCorrect,
                ),

                // Correct answer (only if wrong)
                if (!isCorrect) ...[
                  const SizedBox(height: 12),
                  _AnswerTile(
                    label: 'Risposta corretta',
                    value: answer.correctAnswer,
                    isCorrect: true,
                    isCorrectAnswer: true,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerTile extends StatelessWidget {
  const _AnswerTile({
    required this.label,
    required this.value,
    required this.isCorrect,
    this.isCorrectAnswer = false,
  });

  final String label;
  final String value;
  final bool isCorrect;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isCorrectAnswer
        ? theme.colorScheme.primary
        : isCorrect
            ? theme.colorScheme.primary
            : theme.colorScheme.error;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCorrectAnswer || isCorrect ? Icons.check_circle : Icons.cancel,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
