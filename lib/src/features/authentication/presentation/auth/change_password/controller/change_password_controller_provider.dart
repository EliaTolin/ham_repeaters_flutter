import 'package:quiz_radioamatori/src/features/authentication/provider/change_password_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_controller_provider.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  FutureOr<void> build() {}

  Future<void> resetPassword(String password) async {
    state = const AsyncLoading();
    await ref.read(changePasswordProvider(password).future);
  }
}
