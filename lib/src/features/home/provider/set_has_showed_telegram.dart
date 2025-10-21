import 'package:app_template/src/features/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_has_showed_telegram.g.dart';

@riverpod
Future<void> setHasShowedTelegram(Ref ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  await repository.setShowedTelegram();
}
