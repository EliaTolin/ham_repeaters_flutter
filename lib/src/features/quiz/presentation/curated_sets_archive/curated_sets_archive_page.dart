import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/common/widgets/loading/circular_loading_widget.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/show_signup_dialog.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_controller.dart';
import 'package:quiz_radioamatori/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_state/curated_sets_archive_state.dart';

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
        return _List(items: state.items);
      },
      loading: () => const Center(child: CircularLoadingWidget()),
      error: (e, st) => Center(child: Text('Errore: $e')),
    );
  }
}

class _List extends StatelessWidget {
  const _List({required this.items});
  final List<CuratedSetPreview> items;

  @override
  Widget build(BuildContext context) {
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
        final it = items[index];
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: .4)),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withValues(alpha: .04),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.secondaryContainer,
                    theme.colorScheme.primaryContainer,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.auto_awesome, color: theme.colorScheme.secondary),
            ),
            title: Text(it.title, maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(
              it.description?.trim().isNotEmpty ?? false
                  ? it.description!.trim()
                  : 'Domande: ${it.questionsCount}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withValues(alpha: .10),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: theme.colorScheme.secondary.withValues(alpha: .25)),
                  ),
                  child: Text(
                    '${it.questionsCount} Q',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            onTap: () {},
          ),
        );
      },
    );
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
