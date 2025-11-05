import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/presentation/widgets/podium_entry.dart';

class LeaderboardPodium extends StatelessWidget {
  const LeaderboardPodium({
    required this.entries,
    super.key,
  });

  final List<LeaderboardEntry> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();

    // Ensure we have at least 3 entries, pad with null if needed
    final first = entries.isNotEmpty ? entries[0] : null;
    final second = entries.length > 1 ? entries[1] : null;
    final third = entries.length > 2 ? entries[2] : null;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.amber.shade50,
            Colors.orange.shade50,
            Colors.deepOrange.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Top 3',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade900,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Second place
              if (second != null)
                Expanded(
                  child: PodiumEntry(
                    entry: second,
                    rank: 2,
                    height: 120,
                    isTopThree: true,
                  ),
                )
              else
                const Expanded(child: SizedBox()),

              const SizedBox(width: 8),

              // First place
              if (first != null)
                Expanded(
                  child: PodiumEntry(
                    entry: first,
                    rank: 1,
                    height: 160,
                    isTopThree: true,
                  ),
                )
              else
                const Expanded(child: SizedBox()),

              const SizedBox(width: 8),

              // Third place
              if (third != null)
                Expanded(
                  child: PodiumEntry(
                    entry: third,
                    rank: 3,
                    height: 100,
                    isTopThree: true,
                  ),
                )
              else
                const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
