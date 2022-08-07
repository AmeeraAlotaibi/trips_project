// ignore_for_file: non_constant_identifier_names

import 'package:frontend/models/profile.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  int? id;
  int? profile;
  String title;
  String? owner;
  String description;
  String image;
  String? owner_image;
  List<int>? want_to;
  List<int>? favorite;
  List<Question>? questions;

  Trip({
    this.id,
    this.profile,
    this.owner,
    this.want_to,
    this.favorite,
    this.owner_image,
    this.questions,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);
}
