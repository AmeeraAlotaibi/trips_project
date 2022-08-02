import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  int? id;
  User owner;
  String title;
  String description;
  String? image;

  Trip({
    this.id,
    required this.owner,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);
}
