// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      user: json['user'] as int?,
      gender: json['gender'] as String?,
      username: json['username'] as String?,
      birth_date: json['birth_date'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      image: json['image'] as String?,
      bio: json['bio'] as String?,
      date_joined: json['date_joined'] as String?,
      trips: (json['trips'] as List<dynamic>?)
          ?.map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
      want_to:
          (json['want_to'] as List<dynamic>?)?.map((e) => e as int).toList(),
      favorite:
          (json['favorite'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'gender': instance.gender,
      'username': instance.username,
      'birth_date': instance.birth_date,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'image': instance.image,
      'bio': instance.bio,
      'date_joined': instance.date_joined,
      'want_to': instance.want_to,
      'favorite': instance.favorite,
      'trips': instance.trips,
    };
