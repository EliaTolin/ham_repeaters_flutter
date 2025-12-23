import 'package:flutter/material.dart';
import 'package:ham_repeaters/src/features/quiz/domain/question/question.dart';

class QuizQuestionWidget extends StatelessWidget {
  const QuizQuestionWidget({
    required this.question,
    required this.currentAnswer,
    required this.onAnswerSelected,
    required this.topicLabel,
    required this.isTrainingMode,
    super.key,
  });

  final Question question;
  final String? currentAnswer;
  final String topicLabel;
  final bool isTrainingMode;
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      'N°${question.id}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.3),
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
                    minHeight:
                        constraints.maxHeight - 32, // Account for padding
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        _buildAnswerOption(
                          context: context,
                          letter: 'A',
                          text: question.answerA,
                          isSelected: currentAnswer == 'A',
                          isTrainingMode: isTrainingMode,
                          isCorrectLetter:
                              question.correctLetter.toUpperCase() == 'A',
                          isWrongSelection: isTrainingMode &&
                              currentAnswer != null &&
                              currentAnswer == 'A' &&
                              question.correctLetter.toUpperCase() != 'A',
                          onTap: () => onAnswerSelected('A'),
                        ),
                        const SizedBox(height: 8),
                        _buildAnswerOption(
                          context: context,
                          letter: 'B',
                          text: question.answerB,
                          isSelected: currentAnswer == 'B',
                          isTrainingMode: isTrainingMode,
                          isCorrectLetter:
                              question.correctLetter.toUpperCase() == 'B',
                          isWrongSelection: isTrainingMode &&
                              currentAnswer != null &&
                              currentAnswer == 'B' &&
                              question.correctLetter.toUpperCase() != 'B',
                          onTap: () => onAnswerSelected('B'),
                        ),
                        const SizedBox(height: 8),
                        _buildAnswerOption(
                          context: context,
                          letter: 'C',
                          text: question.answerC,
                          isSelected: currentAnswer == 'C',
                          isTrainingMode: isTrainingMode,
                          isCorrectLetter:
                              question.correctLetter.toUpperCase() == 'C',
                          isWrongSelection: isTrainingMode &&
                              currentAnswer != null &&
                              currentAnswer == 'C' &&
                              question.correctLetter.toUpperCase() != 'C',
                          onTap: () => onAnswerSelected('C'),
                        ),
                        if (isTrainingMode && currentAnswer != null) ...[
                          const SizedBox(height: 16),
                          _buildTrainingFeedback(context),
                        ],
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
    required bool isTrainingMode,
    required bool isCorrectLetter,
    required bool isWrongSelection,
    required VoidCallback onTap,
  }) {
    final shouldHighlightCorrect =
        isTrainingMode && (isSelected || isWrongSelection);
    final Color borderColor;
    final double borderWidth;
    final Color backgroundColor;
    final bool showTrailingIcon;
    final IconData? trailingIconData;
    final Color? trailingIconColor;

    // Determine the appearance of the answer option box based on selection state and feedback mode.
    if (isTrainingMode && currentAnswer != null) {
      final correctColor = Theme.of(context).colorScheme.tertiary;
      // Training mode: show error border/colors if this was a wrong selection
      if (isWrongSelection) {
        borderColor = Theme.of(context).colorScheme.error;
        borderWidth = 2;
        backgroundColor =
            Theme.of(context).colorScheme.error.withValues(alpha: 0.05);
        showTrailingIcon = true;
        trailingIconData = Icons.cancel_rounded;
        trailingIconColor = Theme.of(context).colorScheme.error;
      }
      // Training mode: highlight correct answer that was selected
      else if (shouldHighlightCorrect && isCorrectLetter) {
        borderColor = correctColor;
        borderWidth = 2;
        backgroundColor = correctColor.withValues(alpha: 0.05);
        showTrailingIcon = true;
        trailingIconData = Icons.check_circle;
        trailingIconColor = correctColor;
      }
      // Training mode: show correct answer even if not selected by the user
      else if (!isSelected && isCorrectLetter && currentAnswer != null) {
        borderColor = correctColor;
        borderWidth = 2;
        backgroundColor = correctColor.withValues(alpha: 0.05);
        showTrailingIcon = true;
        trailingIconData = Icons.check_circle;
        trailingIconColor = correctColor;
      }
      // Training mode: default look for unselected/wrong answers
      else {
        borderColor =
            Theme.of(context).colorScheme.outline.withValues(alpha: 0.3);
        borderWidth = 1;
        backgroundColor = Theme.of(context).colorScheme.surface;
        showTrailingIcon = isSelected;
        trailingIconData = isSelected ? Icons.check_circle : null;
        trailingIconColor = Theme.of(context).colorScheme.primary;
      }
    } else {
      // Standard quiz: selected answers get highlight, others have outline
      borderColor = isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3);
      borderWidth = isSelected ? 2 : 1;
      backgroundColor = isSelected
          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.05)
          : Theme.of(context).colorScheme.surface;
      showTrailingIcon = isSelected;
      trailingIconData = Icons.check_circle;
      trailingIconColor = Theme.of(context).colorScheme.primary;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          color: backgroundColor,
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
                    ? (isTrainingMode && currentAnswer != null
                        ? (isWrongSelection
                            ? Theme.of(context).colorScheme.error
                            : (isCorrectLetter
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context).colorScheme.primary))
                        : Theme.of(context).colorScheme.primary)
                    : Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.2),
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
                          ? (isTrainingMode && currentAnswer != null
                              ? (isWrongSelection
                                  ? Theme.of(context).colorScheme.error
                                  : (isCorrectLetter
                                      ? Theme.of(context).colorScheme.tertiary
                                      : Theme.of(context).colorScheme.primary))
                              : Theme.of(context).colorScheme.primary)
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
              ),
            ),
            // Selection indicator
            if (showTrailingIcon && trailingIconData != null)
              Icon(
                trailingIconData,
                color: trailingIconColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainingFeedback(BuildContext context) {
    final isCorrect = (currentAnswer?.toUpperCase() ?? '') ==
        question.correctLetter.toUpperCase();
    final title = isCorrect ? 'Risposta corretta' : 'Risposta errata';
    final color = isCorrect
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.error;
    final icon = isCorrect ? Icons.check_circle : Icons.cancel_rounded;
    final explanation = question.explanation;
    final reference = question.sourceRef;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Always show the correct answer
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Risposta corretta: ',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: question.correctLetter.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          if ((explanation != null && explanation.trim().isNotEmpty) ||
              (reference != null && reference.trim().isNotEmpty)) ...[
            const SizedBox(height: 12),
            if (explanation != null && explanation.trim().isNotEmpty) ...[
              Text(
                'Spiegazione',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                explanation,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            if (reference != null && reference.trim().isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Riferimenti',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                reference,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.8),
                    ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
