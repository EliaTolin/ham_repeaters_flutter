import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_repeaters/common/extension/l10n_extension.dart';
import 'package:ham_repeaters/config/app_configs.dart';
import 'package:ham_repeaters/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_repeaters/src/features/repeaters_map/presentation/controller/repeaters_map_controller.dart';
import 'package:ham_repeaters/src/features/repeaters_map/service/location_service.dart';
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
    final circleManager = useState<CircleAnnotationManager?>(null);

    final mapState = asyncState.value;

    useEffect(() {
      MapboxOptions.setAccessToken(AppConfigs.getMapboxAccessToken());
      return null;
    }, const []);

    useEffect(() {
      if (mapState == null || mapController.value == null) return null;
      _syncAnnotations(
        mapController.value!,
        circleManager.value,
        mapState.repeaters,
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
    }, [mapState, mapController.value]);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.repeatersMapTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            tooltip: context.localization.repeatersMapRetry,
            onPressed: notifier.refresh,
          ),
        ],
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
            ),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            onMapCreated: (mapboxMap) async {
              mapController.value = mapboxMap;
              circleManager.value =
                  await mapboxMap.annotations.createCircleAnnotationManager();
              await mapboxMap.location.updateSettings(
                LocationComponentSettings(
                  enabled: true,
                  pulsingEnabled: true,
                  showAccuracyRing: true,
                ),
              );
              if (mapState?.latitude != null && mapState?.longitude != null) {
                await _moveCamera(
                  mapboxMap,
                  mapState!.latitude!,
                  mapState.longitude!,
                );
              }
              await _syncAnnotations(
                  mapboxMap, circleManager.value, mapState?.repeaters ?? []);
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
              onRetry: notifier.refresh,
            ),
          if (asyncState.hasError && mapState?.locationError == null)
            _InfoBanner(
              icon: const Icon(Icons.warning_amber_rounded),
              label: context.localization.repeatersMapGenericError,
              trailing: TextButton(
                onPressed: notifier.refresh,
                child: Text(context.localization.repeatersMapRetry),
              ),
            ),
          if (!asyncState.isLoading && (mapState?.repeaters.isEmpty ?? false))
            _InfoBanner(
              icon: const Icon(Icons.location_off_outlined),
              label: context.localization.repeatersMapEmpty,
            ),
          if ((mapState?.repeaters.isNotEmpty ?? false))
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              child: SafeArea(
                child: _SummaryChip(
                  count: mapState!.repeaters.length,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.refresh,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

Future<void> _syncAnnotations(
  MapboxMap map,
  CircleAnnotationManager? manager,
  List<Repeater> repeaters,
) async {
  if (manager == null) return;
  await manager.deleteAll();

  final annotations = <CircleAnnotationOptions>[];
  for (final repeater in repeaters) {
    final lat = repeater.latitude;
    final lon = repeater.longitude;
    if (lat == null || lon == null) continue;

    annotations.add(
      CircleAnnotationOptions(
        geometry: Point(coordinates: Position(lon, lat)),
        circleRadius: 7,
        circleColor: 0xFF1E88E5,
        circleOpacity: 0.9,
        circleStrokeColor: 0xFFFFFFFF,
        circleStrokeWidth: 2,
      ),
    );
  }

  if (annotations.isNotEmpty) {
    await manager.createMulti(annotations);
  }
}

Future<void> _moveCamera(MapboxMap map, double latitude, double longitude) {
  return map.easeTo(
    CameraOptions(
      center: Point(
        coordinates: Position(longitude, latitude),
      ),
      zoom: 8.5,
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
      LocationErrorType.servicesDisabled =>
        l10n.repeatersMapLocationServicesDisabled,
      LocationErrorType.permissionDenied => l10n.repeatersMapPermissionMessage,
      LocationErrorType.permissionPermanentlyDenied =>
        l10n.repeatersMapPermissionPermanentlyDenied,
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
