// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_local_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeLocalDatasource)
const homeLocalDatasourceProvider = HomeLocalDatasourceProvider._();

final class HomeLocalDatasourceProvider extends $FunctionalProvider<
        AsyncValue<HomeDatasource>, HomeDatasource, FutureOr<HomeDatasource>>
    with $FutureModifier<HomeDatasource>, $FutureProvider<HomeDatasource> {
  const HomeLocalDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeLocalDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeLocalDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<HomeDatasource> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeDatasource> create(Ref ref) {
    return homeLocalDatasource(ref);
  }
}

String _$homeLocalDatasourceHash() =>
    r'e174606e37c032e080317d79f5f3660f352eea80';
