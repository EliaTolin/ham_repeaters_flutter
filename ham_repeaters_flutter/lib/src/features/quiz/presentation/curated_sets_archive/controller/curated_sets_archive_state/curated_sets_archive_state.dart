import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_repeaters/src/features/quiz/domain/curated_set/curated_set.dart';

part 'curated_sets_archive_state.freezed.dart';

@freezed
abstract class CuratedSetArchiveItem with _$CuratedSetArchiveItem {
  const factory CuratedSetArchiveItem({
    required CuratedSet curatedSet,
    required bool isCompleted,
  }) = _CuratedSetArchiveItem;
}

@freezed
abstract class CuratedSetsArchiveState with _$CuratedSetsArchiveState {
  const factory CuratedSetsArchiveState({
    @Default(<CuratedSetArchiveItem>[]) List<CuratedSetArchiveItem> items,
    String? errorMessage,
  }) = _CuratedSetsArchiveState;
}
