import 'package:app_template/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState({
    required Profile profile,
    required String email,
    required String? imageProfileUrl,
  }) = _UserState;
}
