import 'package:frontend/models/trip.dart';
import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  User? user;
  String? gender;
  String? birth_date;
  String? image;
  String? bio;
  String? date_joined;
  List<Trip>? trips;

  Profile({
    this.user,
    this.gender,
    this.birth_date,
    this.image,
    this.bio,
    this.date_joined,
    this.trips,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
