import 'dart:developer';

import 'package:ham_repeaters/clients/supabase/supabase_client/supabase_client.dart';
import 'package:ham_repeaters/src/features/leaderboard/data/datasource/leaderboard_datasource.dart';
import 'package:ham_repeaters/src/features/leaderboard/data/model/leaderboard_entry_model/leaderboard_entry_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'leaderboard_supabase_datasource.g.dart';

class LeaderboardSupabaseDatasource implements LeaderboardDatasource {
  LeaderboardSupabaseDatasource(this._client);
  final SupabaseClient _client;

  @override
  Future<List<LeaderboardEntryModel>> getLeaderboard(
      {required int limit}) async {
    try {
      final data = await _client.rpc(
        'get_leaderboard',
        params: {'limit_count': limit},
      );
      return (data as List)
          .map((e) => LeaderboardEntryModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log('Error to fetch leaderboard: $e');
      rethrow;
    }
  }

  @override
  Future<LeaderboardEntryModel?> getUserPosition(String userId) async {
    try {
      final data = await _client.rpc(
        'get_leaderboard_user',
        params: {'p_user_id': userId},
      ).maybeSingle();
      if (data == null || data['user_id'] == null) {
        return null;
      }
      return LeaderboardEntryModel.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      log('Error to fetch user position: $e');
      rethrow;
    }
  }
}

@riverpod
LeaderboardDatasource leaderboardSupabaseDatasource(Ref ref) {
  return LeaderboardSupabaseDatasource(ref.read(supabaseClientProvider));
}
