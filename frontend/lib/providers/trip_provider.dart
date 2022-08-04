import 'package:flutter/material.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/services/Trip_service.dart';

class TripProvider extends ChangeNotifier {
  late List<Trip> trips;
  late Trip newtrip;

  // all trips
  Future<List> getAllTrips() async {
    trips = await TripService().allTrips();
    return trips;
  }

  // create new trip
  Future<Trip> createTrip({required Trip trip}) async {
    newtrip = await TripService().createTrip(trip: trip);
    print("New Trip::: ${newtrip}");
    // notifyListeners();
    return trip;
  }
}
