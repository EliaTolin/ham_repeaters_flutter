import 'package:app_template/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_with_picture.freezed.dart';

@freezed
abstract class ProfileWithPicture with _$ProfileWithPicture {
  const factory ProfileWithPicture({
    required Profile profile,
    required String? propic,
  }) = _ProfileWithPicture;
}
