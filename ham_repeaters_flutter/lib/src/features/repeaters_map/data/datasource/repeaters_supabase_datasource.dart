import 'dart:developer';

import 'package:ham_repeaters/clients/supabase/supabase_client/supabase_client.dart';
import 'package:ham_repeaters/src/features/repeaters_map/data/datasource/repeaters_datasource.dart';
import 'package:ham_repeaters/src/features/repeaters_map/data/model/repeater/repeater_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'repeaters_supabase_datasource.g.dart';

class RepeatersSupabaseDatasource implements RepeatersDatasource {
  RepeatersSupabaseDatasource(this._client);
  final SupabaseClient _client;

  @override
  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    int limit = 50,
    List<String>? modes,
  }) async {
    try {
      final data = await _client.rpc(
        'repeaters_nearby',
        params: <String, dynamic>{
          'p_lat': latitude,
          'p_lon': longitude,
          'p_radius_km': radiusKm,
          'p_limit': limit,
          if (modes != null && modes.isNotEmpty) 'p_modes': modes,
        },
      );

      if (data is! List) {
        return [];
      }

      return data
          .map(
            (e) => RepeaterModel.fromJson(
              Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
            ),
          )
          .toList();
    } catch (error, stackTrace) {
      log('Error fetching repeaters_nearby: $error', stackTrace: stackTrace);
      rethrow;
    }
  }
}

@riverpod
RepeatersDatasource repeatersSupabaseDatasource(Ref ref) {
  return RepeatersSupabaseDatasource(ref.read(supabaseClientProvider));
}
