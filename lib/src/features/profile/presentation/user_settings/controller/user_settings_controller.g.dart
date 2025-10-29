// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserSettingsController)
const userSettingsControllerProvider = UserSettingsControllerProvider._();

final class UserSettingsControllerProvider
    extends $AsyncNotifierProvider<UserSettingsController, UserState> {
  const UserSettingsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userSettingsControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userSettingsControllerHash();

  @$internal
  @override
  UserSettingsController create() => UserSettingsController();
}

String _$userSettingsControllerHash() =>
    r'b8e52859cbc556f8e0c766945766ef1c7c03e8b5';

abstract class _$UserSettingsController extends $AsyncNotifier<UserState> {
  FutureOr<UserState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserState>, UserState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserState>, UserState>,
        AsyncValue<UserState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
