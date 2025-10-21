import 'package:app_template/clients/storage/impl/shared_pref_storage_client.dart';
import 'package:app_template/clients/storage/storage_client.dart';
import 'package:app_template/src/features/home/data/datasource/home_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_local_datasource.g.dart';

class HomeLocalDatasource implements HomeDatasource {
  HomeLocalDatasource(this.sharedPreferences);
  final StorageClient sharedPreferences;

  @override
  Future<bool> hasShowedTelegram() async {
    try {
      final value = await sharedPreferences.read('showedTelegram');
      if (value == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setShowedTelegram() {
    return sharedPreferences.write('showedTelegram', 'true');
  }
}

@riverpod
Future<HomeDatasource> homeLocalDatasource(Ref ref) async {
  final sharedPreferences = await ref.watch(sharedPrefStorageClientProvider.future);

  return HomeLocalDatasource(sharedPreferences);
}
