// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerBody _$PlayerBodyFromJson(Map<String, dynamic> json) => PlayerBody(
      context: json['context'] == null
          ? Context.defaultAndroid
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      videoId: json['videoId'] as String,
      playlistId: json['playlistId'] as String?,
    );

Map<String, dynamic> _$PlayerBodyToJson(PlayerBody instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'videoId': instance.videoId,
      'playlistId': instance.playlistId,
    };
