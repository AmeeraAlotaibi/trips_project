import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  User? user;
  String? gender;
  String? birthDate;
  String? image;
  String? bio;
  String? dateJoined;

  Profile({
    this.user,
    this.gender,
    this.birthDate,
    this.image,
    this.bio,
    this.dateJoined,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
