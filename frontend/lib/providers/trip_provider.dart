import 'package:flutter/material.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/profile_provider.dart';

import 'package:frontend/services/trip_service.dart';

class TripProvider extends ChangeNotifier {
  late List<Trip> trips;
  late Trip newtrip;
  late Trip updatedTrip;

  // all trips
  Future<List<Trip>> getAllTrips() async {
    trips = await TripService().allTrips();
    // notifyListeners();
    return trips;
  }

  // create new trip
  Future<Trip> createTrip({required Trip trip}) async {
    newtrip = await TripService().createTrip(trip: trip);
    // notifyListeners();
    return trip;
  }

  // Edit trips
  Future<Trip> updateTrip({required Trip trip}) async {
    updatedTrip = await TripService().updatedTrip(trip: trip);
    // Trip foundtrip = trips.where((element) => element.id == trip.id) as Trip;
    notifyListeners();
    return updatedTrip;
  }

  //delete
  Future<void> deleteTrip({required Trip trip}) async {
    await TripService().deleteTrip(trip: trip);
    // Trip foundtrip = trips.where((element) => element.id == trip.id) as Trip;
    notifyListeners();
  }

  // // add trip to a list of favorites
  // Future<void> addFav(Trip trip) async {
  //   await TripService().addFav(trip);

  //   // notifyListeners();
  // }

  Future<List<Trip>> getFav(List<Trip> favs) async {
    List<Trip> favorites = [];
    for (Trip trip in trips) {
      if (favs.any((element) => element == trip.id)) {
        favorites.add(trip);
      }
    }
    notifyListeners();
    return favorites;
  }

  List<Trip> getMyFavs(List<int> favorite) {
    List<Trip> favorites = [];
    for (Trip trip in trips) {
      if (favorite.any((element) => element == trip.id)) {
        favorites.add(trip);
      }
    }
    // notifyListeners();
    return favorites;
  }

  List<Trip> getMyWantTO(List<int> wants) {
    List<Trip> wantsList = [];
    for (Trip trip in trips) {
      if (wants.any((element) => element == trip.id)) {
        wantsList.add(trip);
      }
    }
    // notifyListeners();
    return wantsList;
  }

  bool isFav(Trip trip, Profile profile) {
    var item = trip.favorite?.any((element) => element == profile.user);
    // ignore: unnecessary_null_comparison
    // print(profile.user);
    if (item == false) {
      return false;
    } else {
      // print('Hereeee :${item}');
      return true;
    }
  }

  bool isWantTo(Trip trip, Profile profile) {
    var item = trip.want_to?.any((element) => element == profile.user);
    // ignore: unnecessary_null_comparison
    // print(profile.user);
    if (item == false) {
      return false;
    } else {
      // print('Hereeee :${item}');
      return true;
    }
  }

  // add trip to a list of favorites
  Future<void> addFav(Trip trip, Profile profile) async {
    // int user = ProfileProvider().profile;
    await TripService().addFav(trip);
    Trip foundTrip = trips.firstWhere((element) => element.id == trip.id);
    if (isFav(trip, profile)) {
      foundTrip.favorite?.remove(profile.user);
      trip = foundTrip;
    } else {
      foundTrip.favorite?.add(profile.user!);
      trip = foundTrip;
    }
    // notifyListeners();
  }
}
