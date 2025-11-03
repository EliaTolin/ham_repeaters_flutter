import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/question/question.dart';

class QuizQuestionWidget extends StatelessWidget {
  const QuizQuestionWidget({
    required this.question,
    required this.currentAnswer,
    required this.onAnswerSelected,
    required this.topicLabel,
    super.key,
  });

  final Question question;
  final String? currentAnswer;
  final String topicLabel;
  final ValueChanged<String> onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fixed question section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Topic badge
              Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      'N°${question.id}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      topicLabel,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Question text
              Text(
                question.questionText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),

        // Scrollable answer options (only when needed)
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 32, // Account for padding
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        _buildAnswerOption(
                          context: context,
                          letter: 'A',
                          text: question.answerA,
                          isSelected: currentAnswer == 'A',
                          onTap: () => onAnswerSelected('A'),
                        ),
                        const SizedBox(height: 8),
                        _buildAnswerOption(
                          context: context,
                          letter: 'B',
                          text: question.answerB,
                          isSelected: currentAnswer == 'B',
                          onTap: () => onAnswerSelected('B'),
                        ),
                        const SizedBox(height: 8),
                        _buildAnswerOption(
                          context: context,
                          letter: 'C',
                          text: question.answerC,
                          isSelected: currentAnswer == 'C',
                          onTap: () => onAnswerSelected('C'),
                        ),
                        // Add extra padding at the bottom to ensure content doesn't get cut off
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnswerOption({
    required BuildContext context,
    required String letter,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.05)
              : Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          children: [
            // Letter circle
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              ),
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Answer text
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
              ),
            ),
            // Selection indicator
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
