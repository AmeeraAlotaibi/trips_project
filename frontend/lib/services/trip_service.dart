import 'package:dio/dio.dart';
import 'package:frontend/models/profile.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/reply.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/providers/profile_provider.dart';
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

  // Delete trip ================================
  Future<void> deleteTrip({required Trip trip}) async {
    try {
      await Client.dio.delete(
        "trip/${trip.id}",
      );
    } on DioError catch (error) {
      print(error);
    }
  }

  // TO ADD TO MY FAVORITES LIST
  Future<void> addFav(Trip trip) async {
    try {
      await Client.dio.patch(
        "trips/add-favorite/${trip.id}/",
        data: trip.toJson(),
      );
    } on DioError catch (error) {
      print(error);
    }
  }

  // TO ADD TO MY FAVORITES LIST
  Future<void> wantTo(Trip trip) async {
    try {
      await Client.dio.patch(
        "trips/want-to/${trip.id}/",
        data: trip.toJson(),
      );
    } on DioError catch (error) {
      print(error);
    }
  }

  // TO GET MY FAVORITES LIST
  Future<List<Trip>> getMyFav() async {
    late List<Trip> favorites = [];
    try {
      Response res = await Client.dio.get("trips/my-favorite/");
      favorites =
          (res.data as List).map((trip) => Trip.fromJson(trip)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return favorites;
  }

  // TO Post a Question
  Future<void> askQ({required Question question, tripId}) async {
    try {
      await Client.dio
          .post('question/post?trip_id=$tripId', data: question.toJson());
    } on DioError catch (error) {
      print(error);
    }
  }

  // TO Reply
  Future<void> reply({required Reply reply, questionId}) async {
    try {
      await Client.dio
          .post('question/reply?question_id=$questionId', data: reply.toJson());
    } on DioError catch (error) {
      print(error);
    }
  }
}
