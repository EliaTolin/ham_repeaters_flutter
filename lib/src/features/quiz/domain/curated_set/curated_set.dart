import 'package:freezed_annotation/freezed_annotation.dart';

part 'curated_set.freezed.dart';

@freezed
abstract class CuratedSet with _$CuratedSet {
  const factory CuratedSet({
    required String id,
    required String ownerId,
    required String title,
    required bool isPublished,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? description,
    List<String>? customTopics,
  }) = _CuratedSet;
}
