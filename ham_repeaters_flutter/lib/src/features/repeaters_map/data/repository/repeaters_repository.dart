import 'package:ham_repeaters/src/features/repeaters_map/data/datasource/repeaters_datasource.dart';
import 'package:ham_repeaters/src/features/repeaters_map/data/datasource/repeaters_supabase_datasource.dart';
import 'package:ham_repeaters/src/features/repeaters_map/data/mappers/repeaters_mappers.dart';
import 'package:ham_repeaters/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_repository.g.dart';

class RepeatersRepository {
  RepeatersRepository(this._datasource);
  final RepeatersDatasource _datasource;

  final _mapper = RepeatersMappers();

  Future<List<Repeater>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    int limit = 50,
    List<RepeaterMode>? modes,
  }) async {
    final data = await _datasource.getRepeatersNearby(
      latitude: latitude,
      longitude: longitude,
      radiusKm: radiusKm,
      limit: limit,
      modes: _mapper.mapModesToValues(modes),
    );
    return data.map(_mapper.fromModel).toList();
  }
}

@riverpod
RepeatersRepository repeatersRepository(Ref ref) {
  final datasource = ref.read(repeatersSupabaseDatasourceProvider);
  return RepeatersRepository(datasource);
}
