import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/router/app_router.dart';
import 'package:quiz_radioamatori/src/features/authentication/presentation/auth/show_signup_dialog.dart';
import 'package:quiz_radioamatori/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/quiz_set_score.dart';

class RecentQuizzesSection extends HookConsumerWidget {
  const RecentQuizzesSection({required this.scores, super.key});

  final List<QuizSetScore> scores;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Animazioni in ingresso con vero "stagger"
    final controller = useAnimationController(
      duration: Duration(milliseconds: 250 + (scores.length * 80).clamp(0, 700)),
    );

    useEffect(
      () {
        controller.forward();
        return null;
      },
      [],
    );

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: .4)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: .04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header compatto
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                _softIcon(
                  theme,
                  icon: Icons.trending_up_rounded,
                  bg: theme.colorScheme.primary.withValues(alpha: .1),
                  fg: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quiz passati',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        scores.isEmpty
                            ? 'Nessun quiz completato'
                            : 'Ultimi ${scores.length} quiz completati',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (scores.isNotEmpty) _pill(theme, '${scores.length}', theme.colorScheme.primary),
              ],
            ),
          ),
          const Divider(height: 1),
          // Contenuto
          if (scores.isEmpty)
            _EmptyState(theme: theme)
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: scores.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final score = scores[index];
                  final curved = CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                      index / (scores.length.clamp(1, 999)),
                      (index + 1) / (scores.length.clamp(1, 999)),
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
                      child: _ClickableQuizCard(
                        theme: theme,
                        score: score,
                        onTap: () async {
                          if (await ref.read(isAnonymousProvider.future)) {
                            // Quando serve registrazione
                            if (context.mounted) {
                              await showSignUpDialog(context);
                              return;
                            }
                          } else {
                            if (context.mounted) {
                              await context.router.push(
                                QuizResultsRoute(
                                  setId: score.setId,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  // —— Helpers UI ——

  static Widget _pill(ThemeData theme, String text, Color color) {
    return Container(
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

  static Widget _softIcon(
    ThemeData theme, {
    required IconData icon,
    required Color bg,
    required Color fg,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: fg, size: 20),
    );
  }
}

class _ClickableQuizCard extends StatelessWidget {
  const _ClickableQuizCard({required this.theme, required this.score, this.onTap});
  final ThemeData theme;
  final QuizSetScore score;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final examType = score.exam?.value ?? 'Personalizzato';
    final accuracy = score.accuracyPct.clamp(0, 100);
    final perfLabel = _performanceLabel(accuracy.toDouble());
    final perfColor = _performanceColor(accuracy.toDouble());

    return Material(
      color: theme.colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          // Usiamo LayoutBuilder per riservare uno spazio fisso al trailing,
          // evitando che il testo centrale lo "spinga" fuori.
          child: LayoutBuilder(
            builder: (context, constraints) {
              final trailingMaxW = (constraints.maxWidth * 0.34).clamp(96, 148);
              return ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 64), // touch target
                child: Row(
                  children: [
                    // Leading: anello progresso
                    _ProgressRing(
                      progress: accuracy / 100,
                      size: 42,
                      thickness: 5,
                      color: perfColor,
                      child:
                          Icon(_quizIcon(examType), size: 18, color: theme.colorScheme.onSurface),
                    ),
                    const SizedBox(width: 12),

                    // Testo centrale espandibile
                    Expanded(
                      child: _TitleSubtitle(
                        theme: theme,
                        title: 'Quiz ${examType.toUpperCase()}',
                        subtitle: 'Corrette ${score.correct}/${score.total}',
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Trailing: chip + % (colonna stretta, NON si espande)
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: trailingMaxW.toDouble()),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _chip(theme, perfLabel, perfColor),
                          const SizedBox(height: 6),
                          Text(
                            '${accuracy.toStringAsFixed(1)}%',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFeatures: const [FontFeature.tabularFigures()],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: onTap,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // —— UI helpers
  static Widget _chip(ThemeData theme, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: .25)),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }

  static String _performanceLabel(double a) {
    if (a >= 90) return 'Eccellente';
    if (a >= 80) return 'Ottimo';
    if (a >= 70) return 'Buono';
    if (a >= 60) return 'Sufficiente';
    return 'Insufficiente';
  }

  static Color _performanceColor(double a) {
    if (a >= 90) return Colors.green;
    if (a >= 80) return Colors.lightGreen;
    if (a >= 70) return Colors.orange;
    if (a >= 60) return Colors.deepOrange;
    return Colors.red;
  }

  static IconData _quizIcon(String examType) {
    switch (examType.toLowerCase()) {
      case 'completo':
        return Icons.quiz_rounded;
      case 'parziale':
        return Icons.quiz_outlined;
      case 'personalizzato':
        return Icons.tune_rounded;
      default:
        return Icons.quiz_rounded;
    }
  }
}

// Titolo/sottotitolo con gestione sicura degli spazi
class _TitleSubtitle extends StatelessWidget {
  const _TitleSubtitle({required this.theme, required this.title, required this.subtitle});
  final ThemeData theme;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontFeatures: const [FontFeature.tabularFigures()],
            height: 1.1,
          ),
        ),
      ],
    );
  }
}

// =======================
//  EMPTY STATE COMPATTO
// =======================
class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 28),
      child: Column(
        children: [
          _ghost(theme),
          const SizedBox(height: 14),
          Text(
            'Nessun quiz completato',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Inizia il tuo primo quiz per vedere i risultati qui.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: .20)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lightbulb_outline, size: 18, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Prova un quiz completo o parziale',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ghost(ThemeData theme) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        Icons.quiz_outlined,
        color: theme.colorScheme.primary.withValues(alpha: .60),
        size: 28,
      ),
    );
  }
}

// =======================
//  PROGRESS RING
// =======================
class _ProgressRing extends StatelessWidget {
  const _ProgressRing({
    required this.progress,
    required this.size,
    required this.thickness,
    required this.color,
    this.child,
  });

  final double progress; // 0..1
  final double size;
  final double thickness;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).colorScheme.outlineVariant.withValues(alpha: .35);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: 1,
                strokeWidth: thickness,
                valueColor: AlwaysStoppedAnimation<Color>(bg),
              ),
              CircularProgressIndicator(
                value: value.clamp(0, 1),
                strokeWidth: thickness,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
              if (child != null) child!,
            ],
          ),
        );
      },
    );
  }
}
