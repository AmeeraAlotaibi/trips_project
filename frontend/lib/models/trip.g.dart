// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as int?,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
