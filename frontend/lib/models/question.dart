// ignore_for_file: non_constant_identifier_names

import 'package:frontend/models/reply.dart';
import 'package:frontend/models/trip.dart';
import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  int? id;
  int? trip;
  int? profile;
  String? text;
  String? image;
  List<Reply>? replies;

  Question({
    this.id,
    this.trip,
    this.profile,
    this.text,
    this.image,
    this.replies,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
