import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_repeaters/common/extension/l10n_extension.dart';
import 'package:ham_repeaters/common/utils/repeater_mode_helper.dart';
import 'package:ham_repeaters/l10n/app_localizations.dart';
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
    final pointManager = useState<PointAnnotationManager?>(null);

    final mapState = asyncState.value;

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
                await _moveCamera(
                  mapboxMap,
                  mapState!.latitude!,
                  mapState.longitude!,
                );
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
          if (mapState?.repeaters.isNotEmpty ?? false)
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
        iconSize: 1,
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
    builder: (context) => _RepeaterDetailsSheet(repeater: repeater),
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

class _RepeaterDetailsSheet extends ConsumerWidget {
  const _RepeaterDetailsSheet({required this.repeater});

  final Repeater repeater;

  String _getModeLabel(RepeaterMode mode, AppLocalizations l10n) {
    return switch (mode) {
      RepeaterMode.analog => l10n.repeaterModeAnalog,
      RepeaterMode.c4fm => l10n.repeaterModeC4fm,
      RepeaterMode.dstar => l10n.repeaterModeDstar,
      RepeaterMode.dmr => l10n.repeaterModeDmr,
      RepeaterMode.allmode => l10n.repeaterModeAllmode,
      RepeaterMode.echolink => l10n.repeaterModeEcholink,
      RepeaterMode.winlink => l10n.repeaterModeWinlink,
    };
  }

  String _formatFrequency(int frequencyHz) {
    if (frequencyHz >= 1000000) {
      return '${(frequencyHz / 1000000).toStringAsFixed(3)} MHz';
    } else if (frequencyHz >= 1000) {
      return '${(frequencyHz / 1000).toStringAsFixed(1)} kHz';
    }
    return '$frequencyHz Hz';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            repeater.callsign,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (repeater.name != null) ...[
            const SizedBox(height: 4),
            Text(
              repeater.name!,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
          const SizedBox(height: 16),
          _DetailRow(
            icon: Icons.radio,
            label: l10n.repeaterMode,
            value: _getModeLabel(repeater.mode, l10n),
            modeColor: RepeaterModeHelper.getModeColorObject(repeater.mode),
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.waves,
            label: l10n.repeaterFrequency,
            value: _formatFrequency(repeater.frequencyHz),
          ),
          if (repeater.locality != null || repeater.region != null) ...[
            const SizedBox(height: 12),
            _DetailRow(
              icon: Icons.location_on,
              label: l10n.repeaterLocation,
              value: [
                repeater.locality,
                repeater.region,
              ].whereType<String>().join(', '),
            ),
          ],
          if (repeater.distanceMeters != null) ...[
            const SizedBox(height: 12),
            _DetailRow(
              icon: Icons.straighten,
              label: l10n.repeaterDistance,
              value: repeater.distanceMeters! < 1000
                  ? '${repeater.distanceMeters!.toStringAsFixed(0)} m'
                  : '${(repeater.distanceMeters! / 1000).toStringAsFixed(1)} km',
            ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.modeColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? modeColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = modeColor ?? theme.colorScheme.primary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  if (modeColor != null) ...[
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: modeColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
