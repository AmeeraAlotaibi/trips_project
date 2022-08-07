// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as int?,
      profile: json['profile'] as int?,
      owner: json['owner'] as String?,
      want_to:
          (json['want_to'] as List<dynamic>?)?.map((e) => e as int).toList(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      favorite:
          (json['favorite'] as List<dynamic>?)?.map((e) => e as int).toList(),
      owner_image: json['owner_image'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'title': instance.title,
      'owner': instance.owner,
      'description': instance.description,
      'image': instance.image,
      'owner_image': instance.owner_image,
      'want_to': instance.want_to,
      'favorite': instance.favorite,
    };
