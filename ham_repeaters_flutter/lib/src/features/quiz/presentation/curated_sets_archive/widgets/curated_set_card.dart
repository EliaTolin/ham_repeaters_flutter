import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ham_repeaters/src/features/quiz/presentation/curated_sets_archive/controller/curated_sets_archive_state/curated_sets_archive_state.dart';

class CuratedSetCard extends StatelessWidget {
  const CuratedSetCard({
    required this.item,
    required this.onTap,
    super.key,
  });

  final CuratedSetArchiveItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final curatedSet = item.curatedSet;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: .4),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withValues(alpha: .04),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header con icona e stato completato
                Row(
                  children: [
                    const SizedBox(width: 12),
                    // Titolo e stato
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            curatedSet.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: item.isCompleted
                                  ? theme.colorScheme.primary
                                      .withValues(alpha: .10)
                                  : theme.colorScheme.tertiary
                                      .withValues(alpha: .10),
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(
                                color: item.isCompleted
                                    ? theme.colorScheme.primary
                                        .withValues(alpha: .25)
                                    : theme.colorScheme.tertiary
                                        .withValues(alpha: .25),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  item.isCompleted
                                      ? Icons.check_circle_outline
                                      : Icons.radio_button_unchecked,
                                  size: 14,
                                  color: item.isCompleted
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.tertiary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  item.isCompleted ? 'Completato' : 'Da fare',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: item.isCompleted
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
                // Descrizione
                if (curatedSet.description?.trim().isNotEmpty ?? false) ...[
                  const SizedBox(height: 12),
                  Text(
                    curatedSet.description!.trim(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                ],
                // Argomenti se disponibili
                if (curatedSet.customTopics != null &&
                    curatedSet.customTopics!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: curatedSet.customTopics!.take(3).map((topic) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer
                              .withValues(alpha: .5),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: theme.colorScheme.secondary
                                .withValues(alpha: .2),
                          ),
                        ),
                        child: Text(
                          topic,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  if (curatedSet.customTopics!.length > 3)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '+${curatedSet.customTopics!.length - 3} altri',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
                // Footer con data di creazione
                const SizedBox(height: 12),
                Divider(
                  height: 1,
                  color: theme.colorScheme.outlineVariant.withValues(alpha: .4),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Creato: ${_formatDate(curatedSet.createdAt)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (curatedSet.updatedAt != curatedSet.createdAt) ...[
                      const Spacer(),
                      Icon(
                        Icons.update,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Aggiornato: ${_formatDate(curatedSet.updatedAt)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Oggi';
    } else if (difference.inDays == 1) {
      return 'Ieri';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} giorni fa';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return weeks == 1 ? '1 settimana fa' : '$weeks settimane fa';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? '1 mese fa' : '$months mesi fa';
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }
}
