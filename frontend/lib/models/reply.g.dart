// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      id: json['id'] as int?,
      question: json['question'] as int?,
      profile: json['profile'] as int?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'profile': instance.profile,
      'text': instance.text,
    };
