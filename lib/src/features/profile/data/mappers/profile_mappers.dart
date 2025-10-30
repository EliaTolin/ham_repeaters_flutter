import 'package:quiz_radioamatori/common/abstracts/mapper.dart';
import 'package:quiz_radioamatori/common/extension/string_cleared_value_extension.dart';
import 'package:quiz_radioamatori/src/features/profile/data/model/profile_model/profile_model.dart';
import 'package:quiz_radioamatori/src/features/profile/domain/profile/profile.dart';

class ProfileMappers implements Mapper<Profile, ProfileModel> {
  @override
  Profile fromModel(ProfileModel user) {
    return Profile(
      id: user.id,
      name: user.firstName,
      surname: user.lastName,
      propic: user.propic.clearedValue(),
    );
  }

  @override
  ProfileModel toModel(Profile user) {
    return ProfileModel(
      id: user.id,
      firstName: user.name,
      lastName: user.surname,
      propic: user.propic.clearedValue(),
    );
  }
}
