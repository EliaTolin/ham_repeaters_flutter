import 'package:app_template/src/features/home/data/datasource/home_datasource.dart';
import 'package:app_template/src/features/home/data/datasource/home_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeRepository(this.dataSource);
  final HomeDatasource dataSource;

  Future<bool> hasShowedTelegram() {
    return dataSource.hasShowedTelegram();
  }

  Future<void> setShowedTelegram() {
    return dataSource.setShowedTelegram();
  }
}

@riverpod
Future<HomeRepository> homeRepository(Ref ref) async {
  final dataSource = await ref.watch(homeLocalDatasourceProvider.future);
  return HomeRepository(dataSource);
}
