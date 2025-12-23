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

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadRepeaters);
  }

  Future<RepeatersMapState> _loadRepeaters() async {
    try {
      final position =
          await ref.read(locationServiceProvider).getCurrentPosition();
      final repeaters = await ref.read(
        getRepeatersNearbyProvider(
          latitude: position.latitude,
          longitude: position.longitude,
          radiusKm: 100,
          limit: 150,
        ).future,
      );

      return RepeatersMapState(
        repeaters: repeaters,
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } on LocationException catch (error) {
      return RepeatersMapState(
        locationError: error.type,
        repeaters: state.value?.repeaters ?? const [],
        latitude: state.value?.latitude,
        longitude: state.value?.longitude,
      );
    }
  }
}
