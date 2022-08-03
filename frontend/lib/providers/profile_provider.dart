import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  Profile profile = Profile();
  Future<Profile> getProfileData() async {
    profile = await ProfileService().getUserProfile();
    notifyListeners();
    print(profile);
    return profile;
  }
}
