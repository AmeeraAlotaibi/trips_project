import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/services/Trip_service.dart';

class TripProvider extends ChangeNotifier {
  late List<Trip> trips;
  late Trip newtrip;
  late Trip updatedTrip;

  // all trips
  Future<List> getAllTrips() async {
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
}
