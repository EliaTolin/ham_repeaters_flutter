import 'package:app_template/src/features/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'has_showed_telegram.g.dart';

@riverpod
Future<bool> hasShowedTelegram(Ref ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.hasShowedTelegram();
}
