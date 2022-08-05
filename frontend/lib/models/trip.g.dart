// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as int?,
      profile: json['profile'] as int?,
      title: json['title'] as String,
      owner: json['owner'] as String?,
      description: json['description'] as String,
      image: json['image'] as String,
      owner_image: json['owner_image'] as String,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'owner': instance.owner,
    };
