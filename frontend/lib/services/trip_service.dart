import 'package:dio/dio.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/services/client.dart';
import '../models/user.dart';

class TripService {
  //All Trips ================================
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

// Create new trip ================================
  Future<Trip> createTrip({required Trip trip}) async {
    late Trip newtrip;

    try {
      FormData data = FormData.fromMap({
        "title": trip.title,
        "description": trip.description,
        "image": await MultipartFile.fromFile(
          trip.image,
        ),
      });

      Response res = await Client.dio.post(
        "new-trip/",
        data: data,
      );
      newtrip = Trip.fromJson(res.data);
    } on DioError catch (error) {
      print(error);
    }
    return newtrip;
  }

  // Edit trip ================================
  Future<Trip> updatedTrip({required Trip trip}) async {
    late Trip updatedTrip;
    try {
      if (trip.image != "") {
        FormData data = FormData.fromMap({
          "title": trip.title,
          "description": trip.description,
          "image": await MultipartFile.fromFile(
            trip.image,
          ),
        });
        Response res = await Client.dio.put(
          "trip/${trip.id}",
          data: data,
        );
        updatedTrip = Trip.fromJson(res.data);
      } else {
        FormData data = FormData.fromMap({
          "title": trip.title,
          "description": trip.description,
        });
        Response res = await Client.dio.put(
          "trip/${trip.id}",
          data: data,
        );
        updatedTrip = Trip.fromJson(res.data);
      }
    } on DioError catch (error) {
      print(error);
    }
    return updatedTrip;
  }
}
