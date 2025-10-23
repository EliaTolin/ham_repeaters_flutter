import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/exam_type.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/controller/quiz_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/widgets/quiz_navigation_widget.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/widgets/quiz_progress_widget.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/quiz_page/widgets/quiz_question_widget.dart';

@RoutePage()
class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({required this.examType, super.key});
  final ExamType examType;

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    // Initialize quiz when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizControllerProvider(widget.examType).notifier).initializeQuiz(widget.examType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizControllerProvider(widget.examType));

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz ${widget.examType.value}'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (quizState.value != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  '${quizState.value!.answeredQuestions}/${quizState.value!.totalQuestions}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
      body: quizState.when(
        data: (data) {
          if (data == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Inizializzazione quiz...'),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Progress indicator
              QuizProgressWidget(
                currentIndex: data.currentQuestionIndex,
                totalQuestions: data.totalQuestions,
                answeredQuestions: data.answeredQuestions,
              ),
              // Question content
              Expanded(
                child: QuizQuestionWidget(
                  question: data.currentQuestion,
                  currentAnswer: data.currentAnswer,
                  onAnswerSelected: (letter) {
                    ref
                        .read(quizControllerProvider(widget.examType).notifier)
                        .answerQuestion(letter);
                  },
                ),
              ),

              // Navigation buttons
              QuizNavigationWidget(
                canGoPrevious: data.canGoPrevious,
                canGoNext: data.canGoNext,
                canSubmit: data.canSubmit,
                isSubmitting: data.isSubmitting,
                onPrevious: () {
                  ref.read(quizControllerProvider(widget.examType).notifier).goToPreviousQuestion();
                },
                onNext: () {
                  ref.read(quizControllerProvider(widget.examType).notifier).goToNextQuestion();
                },
                onSubmit: () {
                  ref.read(quizControllerProvider(widget.examType).notifier).submitQuiz();
                },
              ),
            ],
          );
        },
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Caricamento quiz...'),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red.shade700,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Errore nel caricamento del quiz',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.red.shade700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red.shade600),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(quizControllerProvider(widget.examType).notifier)
                          .initializeQuiz(widget.examType);
                    },
                    child: const Text('Riprova'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
