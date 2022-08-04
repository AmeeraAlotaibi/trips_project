import 'package:frontend/models/trip.dart';
import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  User? user;
  String? gender;
  // ignore: non_constant_identifier_names
  String? birth_date;
  String? image;
  String? bio;
  // ignore: non_constant_identifier_names
  String? date_joined;
  List<Trip>? trips;

  Profile({
    this.user,
    this.gender,
    // ignore: non_constant_identifier_names
    this.birth_date,
    this.image,
    this.bio,
    // ignore: non_constant_identifier_names
    this.date_joined,
    this.trips,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
