import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/common/widgets/loading/circular_loading_widget.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/show_signup_dialog.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_state/curated_sets_archive_state.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/curated_sets_archive/widgets/curated_set_card.dart';

@RoutePage()
class CuratedSetsArchivePage extends ConsumerWidget {
  const CuratedSetsArchivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Archivio set curati')),
      body: FutureBuilder<bool>(
        future: ref.read(isAnonymousProvider.future),
        builder: (context, anonSnap) {
          if (!anonSnap.hasData) {
            return const Center(child: CircularLoadingWidget());
          }
          if (anonSnap.data ?? false) {
            return _RequireLogin(onTap: () async => showSignUpDialog(context));
          }
          return _Content(ref: ref);
        },
      ),
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content({required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef _) {
    final async = ref.watch(curatedSetsArchiveControllerProvider);
    return async.when(
      data: (CuratedSetsArchiveState state) {
        if ((state.errorMessage ?? '').isNotEmpty) {
          return Center(child: Text(state.errorMessage!));
        }
        return _List(items: state.items, ref: ref);
      },
      loading: () => const Center(child: CircularLoadingWidget()),
      error: (e, st) => Center(child: Text('Errore: $e')),
    );
  }
}

class _List extends ConsumerWidget {
  const _List({required this.items, required this.ref});
  final List<CuratedSetArchiveItem> items;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.inbox_outlined, size: 42, color: theme.colorScheme.outline),
              const SizedBox(height: 12),
              const Text('Nessun set curato disponibile'),
              const SizedBox(height: 4),
              Text(
                'Torna più tardi: quando la redazione pubblica nuovi set li troverai qui.',
                textAlign: TextAlign.center,
                style:
                    theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return CuratedSetCard(
          item: item,
          onTap: () => _startCuratedSetQuiz(context, ref, item),
        );
      },
    );
  }

  Future<void> _startCuratedSetQuiz(
    BuildContext context,
    WidgetRef ref,
    CuratedSetArchiveItem item,
  ) async {
    final curatedSet = item.curatedSet;

    // Verifica se l'utente è anonimo
    if (await ref.read(isAnonymousProvider.future)) {
      if (context.mounted) {
        await showSignUpDialog(context);
      }
      return;
    }

    if (context.mounted) {
      await context.router.push(QuizRoute(curatedSetId: curatedSet.id));
    }
  }
}

class _RequireLogin extends StatelessWidget {
  const _RequireLogin({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Accedi per vedere i set curati'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onTap,
              child: const Text('Accedi / Registrati'),
            ),
          ],
        ),
      ),
    );
  }
}
