// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      user: User?.fromJson(json['user'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      birth_date: json['birth_date'] as String?,
      image: json['image'] as String?,
      bio: json['bio'] as String?,

      date_joined: json['date_joined'] as String?,


    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'gender': instance.gender,
      'birth_date': instance.birth_date,
      'image': instance.image,
      'bio': instance.bio,
      'date_joined': instance.date_joined,
    };
