import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ham_repeaters/common/dialogs/quiz_mode_picker.dart';
import 'package:ham_repeaters/router/app_router.dart';
import 'package:ham_repeaters/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_repeaters/src/features/quiz/domain/topic_request/topic_request.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/custom_quiz_builder/controller/custom_quiz_builder_controller.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/custom_quiz_builder/state/custom_quiz_builder_state/custom_quiz_builder_state.dart';

@RoutePage()
class CustomQuizBuilderPage extends HookConsumerWidget {
  const CustomQuizBuilderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customQuizBuilderControllerProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Crea Quiz Personalizzato'),
        centerTitle: true,
      ),
      body: state.when(
        data: (data) => _buildContent(context, ref, data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildError(context, ref, error),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    CustomQuizBuilderState state,
  ) {
    return Column(
      children: [
        // Header with info
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Seleziona i topic e indica quante domande vuoi per ciascuno',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Selected topics summary
        if (state.selectedTopics.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Riassunto Quiz',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildSummaryItem(
                            context,
                            Icons.library_books_outlined,
                            'Topic selezionati',
                            '${state.selectedTopics.length}',
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withValues(alpha: 0.2),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSummaryItem(
                            context,
                            Icons.help_outline,
                            'Totale domande',
                            '${state.totalQuestions}',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Topics list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.availableTopics.length,
            itemBuilder: (context, index) {
              final topic = state.availableTopics[index];
              final isSelected = state.selectedTopics.containsKey(topic.name);
              final questionCount = state.selectedTopics[topic.name] ?? 0;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: isSelected ? 4 : 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    ref
                        .read(customQuizBuilderControllerProvider.notifier)
                        .toggleTopic(topic.name);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                topic.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          ],
                        ),
                        if (topic.description != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            topic.description!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.help_outline,
                              size: 16,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Domande disponibili: ${topic.totalQuestions}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        if (isSelected) ...[
                          const SizedBox(height: 12),
                          Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('Numero domande: '),
                              Expanded(
                                child: Slider(
                                  value: questionCount.toDouble(),
                                  min: 1,
                                  max: topic.totalQuestions.toDouble(),
                                  divisions: topic.totalQuestions - 1,
                                  label: questionCount.toString(),
                                  onChanged: (value) {
                                    ref
                                        .read(
                                          customQuizBuilderControllerProvider
                                              .notifier,
                                        )
                                        .updateQuestionCount(
                                          topic.name,
                                          value.toInt(),
                                        );
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  questionCount.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Start quiz button
        Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: state.hasSelectedTopics
                ? () => _startCustomQuiz(context, ref, state)
                : null,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Avvia Quiz',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, Object error) {
    return Center(
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
            'Errore nel caricamento dei topic',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7),
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(customQuizBuilderControllerProvider.notifier)
                  .loadTopics();
            },
            child: const Text('Riprova'),
          ),
        ],
      ),
    );
  }

  Future<void> _startCustomQuiz(
    BuildContext context,
    WidgetRef ref,
    CustomQuizBuilderState state,
  ) async {
    // Show loading dialog
    if (!context.mounted) return;

    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      ),
    );

    try {
      // Get user ID
      final userId = await ref.read(getUserIdProvider.future);

      if (userId == null) {
        throw Exception('User ID not found for custom quiz builder');
      }

      // Convert selected topics to TopicRequest
      final topicRequests = state.selectedTopics.entries
          .map((e) => TopicRequest(topic: e.key, numQuestions: e.value))
          .toList();

      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loading dialog
      }

      // Ask for mode (training/exam)
      if (!context.mounted) return;
      final mode = await showQuizModePicker(context);
      if (mode == null) return;
      final isTraining = mode == QuizStartMode.training;

      // Navigate to quiz page with custom quiz set
      if (context.mounted) {
        await context.router
            .push(QuizRoute(topics: topicRequests, isTrainingMode: isTraining));
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loading dialog
      }

      // Show error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Errore: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Widget _buildSummaryItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.6),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
