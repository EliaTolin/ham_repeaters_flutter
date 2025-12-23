import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_repeaters/common/extension/l10n_extension.dart';
import 'package:ham_repeaters/common/utils/repeater_mode_helper.dart';
import 'package:ham_repeaters/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_repeaters/src/features/repeaters_map/presentation/controller/repeaters_map_controller.dart';
import 'package:ham_repeaters/src/features/repeaters_map/presentation/controller/state/repeaters_map_state/repeaters_map_state.dart';
import 'package:ham_repeaters/src/features/repeaters_map/presentation/widgets/repeater_details_sheet.dart';
import 'package:ham_repeaters/src/features/repeaters_map/provider/search_repeaters/search_repeaters_provider.dart';
import 'package:ham_repeaters/src/features/repeaters_map/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RepeatersListPage extends HookConsumerWidget {
  const RepeatersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');
    final debounceTimer = useRef<Timer?>(null);

    // Debounce search query - starts timer when user types
    useEffect(
      () {
        void onTextChanged() {
          final currentText = searchController.text.trim();

          // Cancel previous timer if exists
          debounceTimer.value?.cancel();

          // If text is empty, update immediately
          if (currentText.isEmpty) {
            searchQuery.value = '';
            return;
          }

          // Start debounce timer - updates query after user stops typing
          debounceTimer.value = Timer(
            const Duration(milliseconds: 500),
            () {
              searchQuery.value = currentText;
            },
          );
        }

        // Add listener to controller
        searchController.addListener(onTextChanged);

        // Cleanup: remove listener and cancel timer
        return () {
          searchController.removeListener(onTextChanged);
          debounceTimer.value?.cancel();
        };
      },
      [searchController],
    );

    final nearbyAsyncState = ref.watch(repeatersMapControllerProvider);
    final nearbyNotifier = ref.read(repeatersMapControllerProvider.notifier);

    // Determine if we're in search mode based on current text input
    final currentSearchText = searchController.text.trim();
    final isSearchMode = currentSearchText.isNotEmpty;
    final debouncedQuery = searchQuery.value.trim();
    final isTyping = isSearchMode && currentSearchText != debouncedQuery;

    // Only trigger search provider when we have a debounced query
    // If user is typing, we'll show loading state manually
    final searchAsyncState = debouncedQuery.isNotEmpty
        ? ref.watch(
            searchRepeatersProvider(
              query: debouncedQuery,
              modes: nearbyAsyncState.value?.selectedModes.isEmpty ?? true
                  ? null
                  : nearbyAsyncState.value!.selectedModes.toList(),
            ),
          )
        : null;

    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.repeatersListTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: l10n.repeatersSearchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          searchQuery.value = '';
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
      body: isSearchMode
          ? _buildSearchResults(
              context,
              ref,
              searchAsyncState,
              isTyping,
              nearbyAsyncState.value?.selectedModes ?? <RepeaterMode>{},
              nearbyNotifier,
            )
          : _buildNearbyResults(
              context,
              ref,
              nearbyAsyncState,
              nearbyNotifier,
            ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<Repeater>>? searchAsyncState,
    bool isTyping,
    Set<RepeaterMode> selectedModes,
    RepeatersMapController notifier,
  ) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Show loading if user is typing or if provider is loading
    if (isTyping || searchAsyncState == null || searchAsyncState.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return searchAsyncState.when(
      data: (repeaters) {
        if (repeaters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 64,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.repeatersSearchEmpty,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: repeaters.length,
          itemBuilder: (context, index) {
            final repeater = repeaters[index];
            return _RepeaterListItem(
              repeater: repeater,
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 64,
                color: colorScheme.error.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.repeatersMapGenericError,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNearbyResults(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<RepeatersMapState> nearbyAsyncState,
    RepeatersMapController notifier,
  ) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return nearbyAsyncState.when(
      data: (state) {
        if (state.repeaters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_off_outlined,
                  size: 64,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.repeatersMapEmpty,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: _ModeFilterChips(
                selectedModes: state.selectedModes,
                onModeToggled: notifier.toggleModeFilter,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.repeaters.length,
                itemBuilder: (context, index) {
                  final repeater = state.repeaters[index];
                  return _RepeaterListItem(
                    repeater: repeater,
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) {
        if (error is LocationException) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off,
                    size: 64,
                    color: colorScheme.error.withValues(alpha: 0.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    switch (error.type) {
                      LocationErrorType.permissionDenied ||
                      LocationErrorType.permissionPermanentlyDenied =>
                        l10n.repeatersMapPermissionPermanentlyDenied,
                      LocationErrorType.servicesDisabled =>
                        l10n.repeatersMapLocationServicesDisabled,
                    },
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          );
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 64,
                  color: colorScheme.error.withValues(alpha: 0.6),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.repeatersMapGenericError,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RepeaterListItem extends StatelessWidget {
  const _RepeaterListItem({
    required this.repeater,
  });

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final modeColor = RepeaterModeHelper.getModeColorObject(repeater.mode);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          _showRepeaterDetails(context, repeater);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: modeColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.radio,
                      color: modeColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repeater.callsign,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (repeater.name != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            repeater.name!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: modeColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: modeColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: modeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.waves,
                    size: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    RepeaterDetailsSheet.formatFrequency(repeater.frequencyHz),
                    style: theme.textTheme.bodyMedium,
                  ),
                  if (repeater.distanceMeters != null) ...[
                    const SizedBox(width: 24),
                    Icon(
                      Icons.straighten,
                      size: 16,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      repeater.distanceMeters! < 1000
                          ? '${repeater.distanceMeters!.toStringAsFixed(0)} m'
                          : '${(repeater.distanceMeters! / 1000).toStringAsFixed(1)} km',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
              if (repeater.locality != null || repeater.region != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        [
                          repeater.locality,
                          repeater.region,
                        ].whereType<String>().join(', '),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showRepeaterDetails(BuildContext context, Repeater repeater) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: RepeaterDetailsSheet(
            repeater: repeater,
            scrollController: scrollController,
          ),
        ),
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

    return SingleChildScrollView(
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
    );
  }
}
