import 'package:flutter/material.dart';
import 'package:quiz_radioamatori/common/widgets/profile_avatar.dart';
import 'package:quiz_radioamatori/src/features/leaderboard/domain/leaderboard_entry/leaderboard_entry.dart';

class PodiumEntry extends StatelessWidget {
  const PodiumEntry({
    required this.entry,
    required this.rank,
    required this.height,
    required this.isTopThree,
    super.key,
  });

  final LeaderboardEntry entry;
  final int rank;
  final double height;
  final bool isTopThree;

  Color _getRankColor() {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.brown.shade400;
      default:
        return Colors.blue;
    }
  }

  IconData _getRankIcon() {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.military_tech;
      case 3:
        return Icons.workspace_premium;
      default:
        return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rankColor = _getRankColor();
    final rankIcon = _getRankIcon();

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        // Medal icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: rankColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: rankColor.withValues(alpha: 0.5),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            rankIcon,
            color: Colors.white,
            size: 32,
          ),
        ),

        // Avatar
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: rankColor,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: rankColor.withValues(alpha: 0.3),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipOval(
            child: ProfileAvatar(
              imageProfilePath: entry.propic,
              size: 80,
            ),
          ),
        ),

        // Name
        Text(
          entry.displayName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        // Podium base
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                rankColor,
                rankColor.withValues(alpha: 0.7),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: rankColor.withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Points
              Text(
                '${entry.points}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Punti',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 8),
              // Accuracy
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${entry.accuracyPercent.toStringAsFixed(1)}%',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
