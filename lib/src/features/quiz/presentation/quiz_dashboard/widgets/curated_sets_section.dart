import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/common/widgets/soft_icon.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/show_signup_dialog.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';

class CuratedSetsSection extends HookConsumerWidget {
  const CuratedSetsSection({required this.curatedSets, super.key});

  final List<CuratedSetPreview> curatedSets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final controller = useAnimationController(
      duration: Duration(milliseconds: 250 + (curatedSets.length * 80).clamp(0, 700)),
    );

    useEffect(
      () {
        controller.forward();
        return null;
      },
      const [],
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.secondaryContainer,
            theme.colorScheme.tertiaryContainer,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                SoftIcon(
                  icon: Icons.star,
                  bg: theme.colorScheme.primary.withValues(alpha: .1),
                  fg: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Set curati dalla redazione',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        curatedSets.isEmpty
                            ? 'Nuovi esercizi arriveranno presto!'
                            : 'Nuovi esercizi selezionati per te',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          if (curatedSets.isEmpty)
            _EmptyState(theme: theme)
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: curatedSets.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final item = curatedSets[index];
                  final curved = CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                      index / (curatedSets.length.clamp(1, 999)),
                      (index + 1) / (curatedSets.length.clamp(1, 999)),
                      curve: Curves.easeOutCubic,
                    ),
                  );
                  return FadeTransition(
                    opacity: curved,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, .08),
                        end: Offset.zero,
                      ).animate(curved),
                      child: _CuratedCard(
                        theme: theme,
                        item: item,
                        onTap: () => _openDetails(context, ref, item),
                      ),
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () async => _openArchive(context, ref),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      'Vedi tutte le esercitazioni curate',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 28,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> _openArchive(BuildContext context, WidgetRef ref) async {
    if (await ref.read(isAnonymousProvider.future)) {
      if (context.mounted) await showSignUpDialog(context);
      return;
    }
    if (context.mounted) {
      await context.router.push(const CuratedSetsArchiveRoute());
    }
  }

  Future<void> _openDetails(
    BuildContext context,
    WidgetRef ref,
    CuratedSetPreview item,
  ) async {
    if (await ref.read(isAnonymousProvider.future)) {
      if (context.mounted) await showSignUpDialog(context);
      return;
    }
    // For now we can direct users to start a quiz using this curated set ID when available.
    // If a dedicated page exists later, wire it here.
  }
}

class _CuratedCard extends StatelessWidget {
  const _CuratedCard({required this.theme, required this.item, this.onTap});
  final ThemeData theme;
  final CuratedSetPreview item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              // Left badge with subtle glow
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.secondaryContainer,
                      theme.colorScheme.primaryContainer,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.secondary.withValues(alpha: .18),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.auto_awesome_rounded,
                  color: theme.colorScheme.secondary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.description?.trim().isNotEmpty ?? false
                          ? item.description!.trim()
                          : 'Domande: ${item.questionsCount}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _Chip(
                theme: theme,
                text: '${item.questionsCount} Q',
                color: theme.colorScheme.secondary,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.theme, required this.text, required this.color});
  final ThemeData theme;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: .25)),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 28),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.inbox_outlined,
              color: theme.colorScheme.secondary.withValues(alpha: .60),
              size: 28,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Nessun nuovo esercizio',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'La redazione non ha pubblicato nuovi set curati.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
