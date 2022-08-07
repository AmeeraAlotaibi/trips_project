// ignore_for_file: non_constant_identifier_names

import 'package:frontend/models/trip.dart';
import 'package:frontend/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reply.g.dart';

@JsonSerializable()
class Reply {
  int? id;
  int? question;
  int? profile;
  String? text;

  Reply({
    this.id,
    this.question,
    this.profile,
    this.text,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyToJson(this);
}
