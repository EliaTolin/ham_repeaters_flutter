import 'dart:io';

import 'package:app_template/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:app_template/src/features/profile/data/datasource/profile_supabase_datasource.dart';
import 'package:app_template/src/features/profile/data/mappers/profile_mappers.dart';
import 'package:app_template/src/features/profile/domain/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this._profileDatasource);
  final ProfileDatasource _profileDatasource;

  Future<void> updateProfile(Profile profile) async {
    return _profileDatasource.updateProfile(ProfileMappers().toModel(profile));
  }

  Future<Profile> getProfile(String userId) async {
    return ProfileMappers().fromModel(await _profileDatasource.getProfile(userId));
  }

  Future<void> uploadPropics(String userId, File image) async {
    return _profileDatasource.uploadPropics(userId, image);
  }

  Future<String> getImagePropicUrl(String userId) async {
    return _profileDatasource.getImagePropicUrl(userId);
  }

  Future<void> deleteImagePropic(String userId) async {
    return _profileDatasource.deleteImagePropic(userId);
  }
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  final datasource = ref.read(profileSupabaseDatasourceProvider);
  return ProfileRepository(datasource);
}
