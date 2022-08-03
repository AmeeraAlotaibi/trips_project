// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] as String?,
      image: json['image'] as String?,
      bio: json['bio'] as String?,
      dateJoined: json['dateJoined'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'bio': instance.bio,
      'dateJoined': instance.dateJoined,
    };
