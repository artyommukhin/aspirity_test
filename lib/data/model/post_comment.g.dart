// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostComment _$$_PostCommentFromJson(Map<String, dynamic> json) =>
    _$_PostComment(
      postId: json['postId'] as int,
      id: json['id'] as int,
      username: json['name'] as String,
      email: json['email'] as String,
      text: json['body'] as String,
    );

Map<String, dynamic> _$$_PostCommentToJson(_$_PostComment instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.username,
      'email': instance.email,
      'body': instance.text,
    };
