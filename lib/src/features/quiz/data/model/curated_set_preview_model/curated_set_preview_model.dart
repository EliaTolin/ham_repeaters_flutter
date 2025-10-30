import 'package:freezed_annotation/freezed_annotation.dart';

part 'curated_set_preview_model.freezed.dart';
part 'curated_set_preview_model.g.dart';

@freezed
abstract class CuratedSetPreviewModel with _$CuratedSetPreviewModel {
  const factory CuratedSetPreviewModel({
    required String id,
    required String title,
    @JsonKey(name: 'questions_count') required int questionsCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? description,
  }) = _CuratedSetPreviewModel;

  factory CuratedSetPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$CuratedSetPreviewModelFromJson(json);
}
