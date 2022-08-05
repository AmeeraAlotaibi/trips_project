// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      user: json['user'] as int?,
      gender: json['gender'] as String?,
      birth_date: json['birth_date'] as String?,
      image: json['image'] as String?,
      bio: json['bio'] as String?,
      date_joined: json['date_joined'] as String?,
      first_name: json['first_name'] as String?,
      username: json['username'] as String?,
      last_name: json['last_name'] as String?,
      trips: (json['trips'] as List<dynamic>?)
          ?.map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'gender': instance.gender,
      'birth_date': instance.birth_date,
      'first_name': instance.first_name,
      'username': instance.username,
      'last_name': instance.last_name,
      'image': instance.image,
      'bio': instance.bio,
      'date_joined': instance.date_joined,
      'trips': instance.trips,
    };
