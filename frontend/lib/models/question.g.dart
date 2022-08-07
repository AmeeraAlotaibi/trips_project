// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as int?,
      trip: json['trip'] as int?,
      profile: json['profile'] as int?,
      text: json['text'] as String?,
      image: json['image'] as String?,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'trip': instance.trip,
      'profile': instance.profile,
      'text': instance.text,
      'image': instance.image,
      'replies': instance.replies,
    };
