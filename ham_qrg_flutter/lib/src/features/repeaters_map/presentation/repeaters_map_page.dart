import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/config/app_configs.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/controller/repeaters_map_controller.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/repeater_details_sheet.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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

    useEffect(
      () {
        MapboxOptions.setAccessToken(AppConfigs.getMapboxAccessToken());
        return null;
      },
      const [],
    );

    useEffect(
      () {
        if (mapState == null || mapController.value == null) return null;
        unawaited(
          _syncAnnotations(
            mapController.value!,
            pointManager.value,
            mapState.repeaters,
          ),
        );
        if (mapState.latitude != null && mapState.longitude != null) {
          unawaited(
            _moveCamera(
              mapController.value!,
              mapState.latitude!,
              mapState.longitude!,
            ),
          );
        }
        return null;
      },
      [mapState, mapController.value],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.repeatersMapTitle),
      ),
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey('repeaters-map'),
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: Position(12.4964, 41.9028),
              ),
              zoom: 5.5,
              bearing: 0,
              pitch: 0,
            ),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            onCameraChangeListener: (cameraState) async {
              // Lock bearing to 0 (north up) whenever camera changes
              if (mapController.value != null) {
                try {
                  final currentState = await mapController.value!.getCameraState();
                  final bearing = currentState.bearing;
                  final pitch = currentState.pitch;

                  // Reset bearing and pitch if they deviate from 0
                  if (bearing.abs() > 0.1 || pitch.abs() > 0.1) {
                    await mapController.value!.setCamera(
                      CameraOptions(
                        center: currentState.center,
                        zoom: currentState.zoom,
                        bearing: 0,
                        pitch: 0,
                      ),
                    );
                    return; // Skip debounce if we're resetting rotation
                  }
                } catch (e) {
                  // Ignore errors
                }
              }

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
              if (mapState?.latitude != null && mapState?.longitude != null) {
                // Store user location
                final lat = mapState!.latitude!;
                final lon = mapState.longitude!;
                userLocation.value = (lat: lat, lon: lon);
                await _moveCamera(mapboxMap, lat, lon);
              }
              await _syncAnnotations(
                mapboxMap,
                manager,
                mapState?.repeaters ?? [],
              );
            },
          ),
          if (asyncState.isLoading)
            _InfoBanner(
              icon: const CircularProgressIndicator.adaptive(),
              label: context.localization.repeatersMapLoading,
            ),
          if (mapState?.locationError != null)
            _PermissionBanner(
              errorType: mapState!.locationError!,
              onRetry: () {
                // Reload by toggling a filter
                notifier.toggleModeFilter(RepeaterMode.analog);
              },
            ),
          if (asyncState.hasError && mapState?.locationError == null)
            _InfoBanner(
              icon: const Icon(Icons.warning_amber_rounded),
              label: context.localization.repeatersMapGenericError,
            ),
          if (!asyncState.isLoading && (mapState?.repeaters.isEmpty ?? false))
            _InfoBanner(
              icon: const Icon(Icons.location_off_outlined),
              label: context.localization.repeatersMapEmpty,
            ),
          if (mapState?.repeaters.isNotEmpty ?? false)
            Positioned(
              top: 32,
              left: 12,
              right: 12,
              child: SafeArea(
                child: _SummaryChip(
                  count: mapState!.repeaters.length,
                ),
              ),
            ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SafeArea(
              child: _ModeFilterChips(
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
  await manager.deleteAll();

  final annotations = <PointAnnotationOptions>[];
  for (final repeater in repeaters) {
    final lat = repeater.latitude;
    final lon = repeater.longitude;
    if (lat == null || lon == null) continue;

    // Generate icon for this mode
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

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({
    required this.icon,
    required this.label,
    this.trailing,
  });

  final Widget icon;
  final String label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 12),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.broadcast_on_home, size: 18),
          const SizedBox(width: 8),
          Text(
            context.localization.repeatersMapFound(count),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _PermissionBanner extends ConsumerWidget {
  const _PermissionBanner({
    required this.errorType,
    required this.onRetry,
  });

  final LocationErrorType errorType;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final description = switch (errorType) {
      LocationErrorType.servicesDisabled => l10n.repeatersMapLocationServicesDisabled,
      LocationErrorType.permissionDenied => l10n.repeatersMapPermissionMessage,
      LocationErrorType.permissionPermanentlyDenied => l10n.repeatersMapPermissionPermanentlyDenied,
    };

    return _InfoBanner(
      icon: const Icon(Icons.my_location_outlined),
      label: description,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async {
              await openAppSettings();
            },
            child: Text(l10n.repeatersMapOpenSettings),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(l10n.repeatersMapRetry),
          ),
        ],
      ),
    );
  }
}

class _ModeFilterChips extends ConsumerWidget {
  const _ModeFilterChips({
    required this.selectedModes,
    required this.onModeToggled,
  });

  final Set<RepeaterMode> selectedModes;
  final ValueChanged<RepeaterMode> onModeToggled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: RepeaterMode.values.map((mode) {
            final isSelected = selectedModes.contains(mode);
            final modeColor = RepeaterModeHelper.getModeColorObject(mode);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                selected: isSelected,
                label: Text(RepeaterModeHelper.getModeLabel(mode, l10n)),
                avatar: CircleAvatar(
                  backgroundColor: modeColor,
                  radius: 8,
                ),
                selectedColor: modeColor.withValues(alpha: 0.2),
                checkmarkColor: modeColor,
                labelStyle: TextStyle(
                  color: isSelected ? modeColor : colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                onSelected: (_) => onModeToggled(mode),
                side: BorderSide(
                  color: isSelected ? modeColor : colorScheme.outline.withValues(alpha: 0.3),
                  width: isSelected ? 1.5 : 1,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
