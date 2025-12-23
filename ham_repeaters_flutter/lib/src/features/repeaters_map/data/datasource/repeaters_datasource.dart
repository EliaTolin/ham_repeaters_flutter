import 'package:ham_repeaters/src/features/repeaters_map/data/model/repeater/repeater_model.dart';

abstract interface class RepeatersDatasource {
  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm,
    int limit,
    List<String>? modes,
  });
}
