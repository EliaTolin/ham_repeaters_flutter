import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/controller/state/repeaters_map_state/repeaters_map_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_map_controller.g.dart';

@riverpod
class RepeatersMapController extends _$RepeatersMapController {
  @override
  FutureOr<RepeatersMapState> build() async {
    return _loadRepeaters();
  }

  Future<void> toggleModeFilter(RepeaterMode mode) async {
    final currentState = state.value;
    if (currentState == null || currentState.latitude == null || currentState.longitude == null) {
      return;
    }

    final newSelectedModes = Set<RepeaterMode>.from(currentState.selectedModes);
    if (newSelectedModes.contains(mode)) {
      newSelectedModes.remove(mode);
    } else {
      newSelectedModes.add(mode);
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadRepeaters(
        latitude: currentState.latitude,
        longitude: currentState.longitude,
        selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      ),
    );
  }

  /// Load repeaters based on map bounds (north, south, east, west)
  Future<void> loadRepeatersFromBounds({
    required double north,
    required double south,
    required double east,
    required double west,
  }) async {
    // Calculate center point from bounds
    final centerLat = (north + south) / 2;
    final centerLon = (east + west) / 2;

    // Calculate radius from bounds (distance from center to corner)
    // Using Haversine formula for more accurate distance
    final latDiff = north - south;
    final lonDiff = east - west;

    // Approximate radius in km (conservative estimate to cover all bounds)
    // Using the larger of the two dimensions and adding 20% buffer
    final radiusKm = (latDiff > lonDiff ? latDiff : lonDiff) * 111.0 * 1.2;

    final currentState = state.value;
    final modesToFilter = currentState?.selectedModes.toList();

    state = await AsyncValue.guard(
      () => _loadRepeaters(
        latitude: centerLat,
        longitude: centerLon,
        radiusKm: radiusKm,
        selectedModes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
      ),
    );
  }

  Future<RepeatersMapState> _loadRepeaters({
    double? latitude,
    double? longitude,
    double radiusKm = 100,
    List<RepeaterMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final finalLatitude = latitude ?? currentState?.latitude;
    final finalLongitude = longitude ?? currentState?.longitude;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    // If we don't have a position, try to get it
    if (finalLatitude == null || finalLongitude == null) {
      try {
        final position = await ref.read(locationServiceProvider).getCurrentPosition();
        return await _loadRepeaters(
          latitude: position.latitude,
          longitude: position.longitude,
          selectedModes: modesToFilter,
        );
      } on LocationException catch (error) {
        return RepeatersMapState(
          locationError: error.type,
          repeaters: currentState?.repeaters ?? const [],
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
        );
      }
    }

    try {
      final repeaters = await ref.read(
        getRepeatersNearbyProvider(
          latitude: finalLatitude,
          longitude: finalLongitude,
          radiusKm: radiusKm,
          limit: 200,
          modes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
        ).future,
      );

      return RepeatersMapState(
        repeaters: repeaters,
        latitude: finalLatitude,
        longitude: finalLongitude,
        selectedModes: modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
      );
    } on LocationException catch (error) {
      return RepeatersMapState(
        locationError: error.type,
        repeaters: currentState?.repeaters ?? const [],
        latitude: currentState?.latitude,
        longitude: currentState?.longitude,
        selectedModes: currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
      );
    }
  }
}
