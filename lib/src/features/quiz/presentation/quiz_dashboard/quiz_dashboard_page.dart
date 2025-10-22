import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_dashboard/controller/quiz_dashboard_controller.dart';

@RoutePage()
class QuizDashboardPage extends ConsumerWidget {
  const QuizDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(quizDashboardControllerProvider);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(
                        Icons.quiz,
                        size: 64,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Benvenuto nel Quiz Radioamatori',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Scegli il tipo di esame che vuoi sostenere',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Bottoni per avviare quiz
              Expanded(
                child: Column(
                  children: [
                    // Bottone Esame Parziale
                    _buildQuizButton(
                      context: context,
                      ref: ref,
                      examType: ExamType.parziale,
                      title: 'Esame Parziale',
                      subtitle: "Quiz con domande specifiche per l'esame parziale",
                      icon: Icons.assignment_turned_in,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 16),

                    // Bottone Esame Totale
                    _buildQuizButton(
                      context: context,
                      ref: ref,
                      examType: ExamType.completo,
                      title: 'Esame Totale',
                      subtitle: 'Quiz completo con tutte le domande',
                      icon: Icons.school,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              // Messaggio di errore
              if (dashboardState.errorMessage != null)
                Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red.shade700,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            dashboardState.errorMessage!,
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(quizDashboardControllerProvider.notifier).clearError();
                          },
                          icon: const Icon(Icons.close),
                          color: Colors.red.shade700,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizButton({
    required BuildContext context,
    required WidgetRef ref,
    required ExamType examType,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            context.router.push(QuizRoute(examType: examType));
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: 0.1),
                  color.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      icon,
                      size: 30,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                        ),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  if (ref.read(quizDashboardControllerProvider).errorMessage != null)
                    Icon(
                      Icons.error_outline,
                      color: Colors.red.shade700,
                    )
                  else
                    Icon(Icons.arrow_forward_ios, color: color),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
