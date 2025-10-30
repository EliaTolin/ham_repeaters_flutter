import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_radioamatori/src/features/quiz/domain/curated_set_preview/curated_set_preview.dart';

part 'curated_sets_archive_state.freezed.dart';

@freezed
abstract class CuratedSetsArchiveState with _$CuratedSetsArchiveState {
  const factory CuratedSetsArchiveState({
    @Default(<CuratedSetPreview>[]) List<CuratedSetPreview> items,
    String? errorMessage,
  }) = _CuratedSetsArchiveState;
}


