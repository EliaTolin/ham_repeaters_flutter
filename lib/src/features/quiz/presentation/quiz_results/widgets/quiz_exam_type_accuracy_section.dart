import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';

class QuizExamTypeAccuracySection extends StatelessWidget {
  const QuizExamTypeAccuracySection({
    required this.examTypeAccuracy,
    super.key,
  });

  final Map<ExamType, double> examTypeAccuracy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (examTypeAccuracy.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.1),
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
                Icons.category_rounded,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Precisione per tipologia',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...examTypeAccuracy.entries.map((entry) {
            final index = examTypeAccuracy.keys.toList().indexOf(entry.key);
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < examTypeAccuracy.length - 1 ? 16 : 0,
              ),
              child: _buildExamTypeCard(
                context,
                entry.key,
                entry.value,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildExamTypeCard(
    BuildContext context,
    ExamType examType,
    double accuracy,
  ) {
    final theme = Theme.of(context);
    final accuracyPercent = (accuracy * 100).clamp(0.0, 100.0);
    final color = _getAccuracyColor(accuracyPercent);
    final examTypeIcon = _getExamTypeIcon(examType);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.1),
            color.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  examTypeIcon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      examType.toString(),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Precisione: ${accuracyPercent.toStringAsFixed(1)}%',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${accuracyPercent.toStringAsFixed(0)}%',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: accuracy.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: color.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getExamTypeIcon(ExamType examType) {
    switch (examType) {
      case ExamType.completo:
        return Icons.quiz_rounded;
      case ExamType.parziale:
        return Icons.assignment_rounded;
    }
  }

  Color _getAccuracyColor(double accuracy) {
    if (accuracy >= 80) return Colors.green;
    if (accuracy >= 60) return Colors.orange;
    return Colors.red;
  }
}
