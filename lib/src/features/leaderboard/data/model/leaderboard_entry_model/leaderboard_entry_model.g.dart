// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardEntryModel _$LeaderboardEntryModelFromJson(
        Map<String, dynamic> json) =>
    _LeaderboardEntryModel(
      userId: json['user_id'] as String,
      displayName: json['display_name'] as String,
      propic: json['propic'] as String?,
      points: (json['points'] as num).toInt(),
      correctAnswers: (json['correct_answers'] as num).toInt(),
      totalAnswers: (json['total_answers'] as num).toInt(),
      accuracyPercent: (json['accuracy_percent'] as num).toDouble(),
      lastAnsweredAt: json['last_answered_at'] as String?,
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderboardEntryModelToJson(
        _LeaderboardEntryModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'propic': instance.propic,
      'points': instance.points,
      'correct_answers': instance.correctAnswers,
      'total_answers': instance.totalAnswers,
      'accuracy_percent': instance.accuracyPercent,
      'last_answered_at': instance.lastAnsweredAt,
      'rank': instance.rank,
    };
