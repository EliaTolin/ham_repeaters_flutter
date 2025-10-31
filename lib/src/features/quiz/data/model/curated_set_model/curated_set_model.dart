import 'package:freezed_annotation/freezed_annotation.dart';

part 'curated_set_model.freezed.dart';
part 'curated_set_model.g.dart';

@freezed
abstract class CuratedSetModel with _$CuratedSetModel {
  const factory CuratedSetModel({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String title,
    @JsonKey(name: 'is_published') required bool isPublished,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? description,
    @JsonKey(name: 'custom_topics') List<String>? customTopics,
  }) = _CuratedSetModel;

  factory CuratedSetModel.fromJson(Map<String, dynamic> json) => _$CuratedSetModelFromJson(json);
}
