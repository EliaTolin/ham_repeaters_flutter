import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/controller/repeaters_map_controller.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/info_banner.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/mode_filter_chips.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/permission_banner.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/sheet/repeater_details_sheet.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/summary_chip.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class RepeatersMapPage extends HookConsumerWidget {
  const RepeatersMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(repeatersMapControllerProvider);
    final notifier = ref.read(repeatersMapControllerProvider.notifier);
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);
    final cameraChangeTimer = useRef<Timer?>(null);
    final userLocation = useState<({double lat, double lon})?>(null);
    final showLocationButton = useState<bool>(false);

    final mapState = asyncState.value;

    // Show loading while controller is loading
    if (asyncState.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.localization.repeatersMapTitle),
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    // Get initial camera position from state or fallback to Rome
    final initialLat = mapState?.latitude ?? 41.9028;
    final initialLon = mapState?.longitude ?? 12.4964;
    final initialZoom = mapState?.latitude != null ? 13.0 : 5.5;

    if (mapState != null && mapState.latitude != null && mapState.longitude != null) {
      userLocation.value = (
        lat: mapState.latitude!,
        lon: mapState.longitude!,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.repeatersMapTitle),
      ),
      body: Stack(
        children: [
          MapWidget(
            key: ValueKey('repeaters-map-${mapState?.latitude}-${mapState?.longitude}'),
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: Position(initialLon, initialLat),
              ),
              zoom: initialZoom,
              bearing: 0,
              pitch: 0,
            ),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            onCameraChangeListener: (cameraState) async {
              // Debounce camera changes to avoid too many API calls
              cameraChangeTimer.value?.cancel();
              cameraChangeTimer.value = Timer(
                const Duration(milliseconds: 800),
                () async {
                  try {
                    if (mapController.value != null) {
                      // Get camera state to calculate bounds
                      final cameraState = await mapController.value!.getCameraState();
                      final centerCoords = cameraState.center.coordinates;
                      final zoom = cameraState.zoom;

                      // Position.coordinates is [longitude, latitude]
                      final centerLat = centerCoords[1]!;
                      final centerLon = centerCoords[0]!;

                      // Check if user is far from their location
                      if (userLocation.value != null) {
                        final distance = geo.Geolocator.distanceBetween(
                          userLocation.value!.lat,
                          userLocation.value!.lon,
                          centerLat.toDouble(),
                          centerLon.toDouble(),
                        );
                        // Show button if more than 500 meters away
                        showLocationButton.value = distance > 500;
                      }

                      // Calculate approximate bounds from center and zoom
                      // At zoom level 0, 1 degree lat ≈ 111km
                      // The visible area is roughly 360 / (2^zoom) degrees
                      final latRange = 360 / (1 << zoom.toInt());
                      final lonRange = latRange * (1 / (1 << (zoom.toInt() ~/ 2)));

                      final controller = ref.read(repeatersMapControllerProvider.notifier);
                      await controller.loadRepeatersFromBounds(
                        north: centerLat + latRange / 2,
                        south: centerLat - latRange / 2,
                        east: centerLon + lonRange / 2,
                        west: centerLon - lonRange / 2,
                      );
                    }
                  } catch (e) {
                    // Ignore errors during camera movement
                  }
                },
              );
            },
            onMapCreated: (mapboxMap) async {
              mapController.value = mapboxMap;
              final manager = await mapboxMap.annotations.createPointAnnotationManager();
              pointManager.value = manager;

              // Setup tap listener for annotations
              manager.tapEvents(
                onTap: (annotation) {
                  final repeaterId = annotation.customData?['repeaterId'] as String?;
                  if (repeaterId != null) {
                    final currentState = ref.read(repeatersMapControllerProvider).value;
                    if (currentState != null) {
                      final repeater = currentState.repeaters.firstWhere(
                        (r) => r.id == repeaterId,
                        orElse: () => throw StateError('Repeater not found'),
                      );
                      _showRepeaterDetails(context, repeater);
                    }
                  }
                },
              );

              await mapboxMap.location.updateSettings(
                LocationComponentSettings(
                  enabled: true,
                  pulsingEnabled: true,
                  showAccuracyRing: true,
                ),
              );

              // Wait a bit to ensure map is fully initialized before creating annotations
              await Future.delayed(const Duration(milliseconds: 200));
              await _syncAnnotations(
                mapboxMap,
                manager,
                mapState?.repeaters ?? [],
              );
            },
          ),
          if (mapState?.locationError != null)
            PermissionBanner(
              errorType: mapState!.locationError!,
              onRetry: () {
                // Reload by toggling a filter
                notifier.toggleModeFilter(RepeaterMode.analog);
              },
            ),
          if (asyncState.hasError && mapState?.locationError == null)
            InfoBanner(
              icon: const Icon(Icons.warning_amber_rounded),
              label: context.localization.repeatersMapGenericError,
            ),
          if (!asyncState.isLoading && (mapState?.repeaters.isEmpty ?? false))
            InfoBanner(
              icon: const Icon(Icons.location_off_outlined),
              label: context.localization.repeatersMapEmpty,
            ),
          if (mapState?.repeaters.isNotEmpty ?? false)
            Positioned(
              top: 32,
              left: 12,
              right: 12,
              child: SafeArea(
                child: SummaryChip(
                  count: mapState!.repeaters.length,
                ),
              ),
            ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SafeArea(
              child: ModeFilterChips(
                selectedModes: mapState?.selectedModes ?? {},
                onModeToggled: notifier.toggleModeFilter,
              ),
            ),
          ),
          if (showLocationButton.value && userLocation.value != null)
            Positioned(
              bottom: 100,
              right: 16,
              child: SafeArea(
                child: FloatingActionButton(
                  onPressed: () async {
                    if (userLocation.value != null && mapController.value != null) {
                      final location = userLocation.value!;
                      // Move camera to user location
                      await _moveCamera(
                        mapController.value!,
                        location.lat,
                        location.lon,
                      );
                      // Reload repeaters at user location
                      final controller = ref.read(repeatersMapControllerProvider.notifier);
                      await controller.loadRepeatersFromBounds(
                        north: location.lat + 0.1,
                        south: location.lat - 0.1,
                        east: location.lon + 0.1,
                        west: location.lon - 0.1,
                      );
                      // Hide button after returning to location
                      showLocationButton.value = false;
                    }
                  },
                  tooltip: 'Torna alla mia posizione',
                  child: const Icon(Icons.my_location),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Future<void> _syncAnnotations(
  MapboxMap map,
  PointAnnotationManager? manager,
  List<Repeater> repeaters,
) async {
  if (manager == null) return;

  try {
    await manager.deleteAll();

    final annotations = <PointAnnotationOptions>[];
    for (final repeater in repeaters) {
      final lat = repeater.latitude;
      final lon = repeater.longitude;
      if (lat == null || lon == null) continue;

      final iconBytes = await RepeaterModeHelper.generateRepeaterIcon(repeater.mode);
      annotations.add(
        PointAnnotationOptions(
          geometry: Point(coordinates: Position(lon, lat)),
          image: iconBytes,
          iconSize: 1.2,
          iconAnchor: IconAnchor.BOTTOM,
          customData: {'repeaterId': repeater.id},
        ),
      );
    }

    if (annotations.isNotEmpty) {
      await manager.createMulti(annotations);
    }
  } catch (e) {
    // Ignore errors if map is not fully initialized yet
    // The annotations will be synced again when the map is ready
  }
}

void _showRepeaterDetails(BuildContext context, Repeater repeater) {
  showModalBottomSheet(
    context: context,
    builder: (context) => RepeaterDetailsSheet(repeater: repeater),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

Future<void> _moveCamera(MapboxMap map, double latitude, double longitude) {
  return map.easeTo(
    CameraOptions(
      center: Point(
        coordinates: Position(longitude, latitude),
      ),
      zoom: 8.5,
      bearing: 0,
      pitch: 0,
    ),
    MapAnimationOptions(duration: 800),
  );
}
