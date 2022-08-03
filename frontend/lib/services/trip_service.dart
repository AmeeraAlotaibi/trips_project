import 'package:dio/dio.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/services/client.dart';
import '../models/user.dart';

class TripService {
  // REGISTER SERVICE ================================
  Future<List<Trip>> allTrips() async {
    List<Trip> trips = [];

    try {
      Response res = await Client.dio.get("trips/");
      trips = (res.data as List)
          .map((trip) => Trip.fromJson(trip))
          .cast<Trip>()
          .toList();
    } on DioError catch (error) {
      print(error.message);
    }
    return trips;
  }

// SIGN IN SERVICE ================================
  Future<Trip> createTrip({required Trip trip}) async {
    late Trip newtrip;

    try {
      Response res = await Client.dio.post(
        "new-trip/",
        data: trip.toJson(),
      );
      print(res);
      newtrip = res.data["access"];
    } on DioError catch (error) {
      print(error);
    }
    return newtrip;
  }
}
