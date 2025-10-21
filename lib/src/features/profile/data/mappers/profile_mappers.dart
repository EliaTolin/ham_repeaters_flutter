import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/common/extension/string_cleared_value_extension.dart';
import 'package:quiz_radioamatori/src/features/profile/data/model/profile_model.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile.dart';

class ProfileMappers implements Mapper<Profile, ProfileModel> {
  @override
  Profile fromModel(ProfileModel user) {
    return Profile(
      id: user.id,
      name: user.name,
      surname: user.surname,
      propic: user.propic.clearedValue(),
    );
  }

  @override
  ProfileModel toModel(Profile user) {
    return ProfileModel(
      id: user.id,
      name: user.name,
      surname: user.surname,
      propic: user.propic.clearedValue(),
    );
  }
}
