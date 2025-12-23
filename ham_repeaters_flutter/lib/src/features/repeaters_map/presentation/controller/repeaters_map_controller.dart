import 'package:ham_repeaters/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_repeaters/src/features/repeaters_map/presentation/controller/state/repeaters_map_state/repeaters_map_state.dart';
import 'package:ham_repeaters/src/features/repeaters_map/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:ham_repeaters/src/features/repeaters_map/service/location_service.dart';
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
    if (currentState == null ||
        currentState.latitude == null ||
        currentState.longitude == null) {
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
        selectedModes:
            newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      ),
    );
  }

  Future<RepeatersMapState> _loadRepeaters({
    double? latitude,
    double? longitude,
    List<RepeaterMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final finalLatitude = latitude ?? currentState?.latitude;
    final finalLongitude = longitude ?? currentState?.longitude;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    // If we don't have a position, try to get it
    if (finalLatitude == null || finalLongitude == null) {
      try {
        final position =
            await ref.read(locationServiceProvider).getCurrentPosition();
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
          selectedModes:
              currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
        );
      }
    }

    try {
      final repeaters = await ref.read(
        getRepeatersNearbyProvider(
          latitude: finalLatitude,
          longitude: finalLongitude,
          radiusKm: 100,
          limit: 150,
          modes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
        ).future,
      );

      return RepeatersMapState(
        repeaters: repeaters,
        latitude: finalLatitude,
        longitude: finalLongitude,
        selectedModes:
            modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
      );
    } on LocationException catch (error) {
      return RepeatersMapState(
        locationError: error.type,
        repeaters: currentState?.repeaters ?? const [],
        latitude: currentState?.latitude,
        longitude: currentState?.longitude,
        selectedModes:
            currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
      );
    }
  }
}
