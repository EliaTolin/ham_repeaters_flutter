import 'package:freezed_annotation/freezed_annotation.dart';

part 'curated_set_preview.freezed.dart';

@freezed
abstract class CuratedSetPreview with _$CuratedSetPreview {
  const factory CuratedSetPreview({
    required String id,
    required String title,
    required int questionsCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? description,
  }) = _CuratedSetPreview;
}
