import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';

class QuickActionsSection extends HookWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );

    final animations = useMemoized(
      () {
        return List.generate(3, (index) {
          return Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval(
                index * 0.2,
                (index * 0.2) + 0.6,
                curve: Curves.easeOutCubic,
              ),
            ),
          );
        });
      },
      [],
    );

    useEffect(
      () {
        animationController.forward();
        return null;
      },
      [],
    );

    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primaryContainer,
                theme.colorScheme.secondaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flash_on_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Azioni Rapide',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildActionCard(
                      context,
                      'Quiz Completo',
                      'Esame completo con tutte le domande',
                      Icons.quiz_rounded,
                      Colors.blue,
                      0,
                      animations,
                      () => _startQuiz(context, ExamType.completo),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionCard(
                      context,
                      'Quiz Parziale',
                      'Esame per esonero parziale.',
                      Icons.assignment_rounded,
                      Colors.green,
                      1,
                      animations,
                      () => _startQuiz(context, ExamType.parziale),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 16),
              // SizedBox(
              //   width: double.infinity,
              //   child: _buildActionCard(
              //     context,
              //     'Quiz Personalizzato',
              //     'Crea un quiz con argomenti specifici',
              //     Icons.tune_rounded,
              //     Colors.orange,
              //     2,
              //     animations,
              //     () => _startCustomQuiz(context),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    int animationIndex,
    List<Animation<double>> animations,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);

    return Transform.scale(
      scale: animations[animationIndex].value,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, ExamType examType) {
    context.router.push(QuizRoute(examType: examType));
  }
}
