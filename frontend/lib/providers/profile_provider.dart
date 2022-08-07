import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/profile_service.dart';

import 'package:frontend/services/trip_service.dart';

class ProfileProvider extends ChangeNotifier {
  late Profile profile = Profile();
  late Profile userProfile = Profile();

  late bool loading = true;
  Future<Profile> getProfileData() async {
    profile = await ProfileService().getUserProfile();
    loading = false;
    return profile;
  }

  Future<void> updateProfile(Profile profile) async {
    await ProfileService().updateProfile(profile: profile);
    notifyListeners();
  }

  Future<Profile> getOtherProfile(int id) async {
    userProfile = await ProfileService().getOtherUsersProfile(id: id);
    return userProfile;
  }

  bool isFav(Trip trip) {
    var item = trip.favorite?.any((element) => element == profile.user);
    // ignore: unnecessary_null_comparison
    print(item);
    if (item == false) {
      return false;
    } else {
      return true;
    }
  }

  // add trip to a list of favorites
  Future<void> addFav(Trip trip, Profile profile) async {
    // int user = ProfileProvider().profile;
    await TripService().addFav(trip);
    notifyListeners();
  }

  // add trip to want to golis
  Future<void> wantTO(Trip trip) async {
    // int user = ProfileProvider().profile;
    await TripService().wantTo(trip);
    notifyListeners();
  }
}
