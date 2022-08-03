import 'package:dio/dio.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/services/client.dart';
import '../models/user.dart';

class ProfileService {
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
}
