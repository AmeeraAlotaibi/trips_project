import 'package:dio/dio.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:frontend/services/client.dart';
import '../models/user.dart';

class ProfileService {
  // get profile data from api
  Future<Profile> getUserProfile() async {
    Profile profile = Profile();
    try {
      Response res = await Client.dio.get("my-profile/");
      profile = Profile.fromJson(res.data);
    } on DioError catch (error) {
      print(error);
    }
    print(profile);
    return profile;
  }

  // Update Profile
  Future<Profile> updateProfile({required Profile profile}) async {
    try {
      FormData data = FormData.fromMap({
        "user": profile.user,
        "username": profile.user!.username,
        "first_name": profile.user!.first_name,
        "last_name": profile.user!.last_name,
        "birth_date": profile.birth_date,
        "gender": profile.gender,
        "bio": profile.bio,
        "username": profile.user!.username,
        "image": await MultipartFile.fromFile(
          profile.image!,
        ),
      });

      print("HERE ------- ${profile.user!.username}");
      Response res = await Client.dio.patch("my-profile/", data: data);
      profile = Profile.fromJson(res.data);
    } on DioError catch (error) {
      print(error.message);
    }

    return profile;
  }

  //
}
