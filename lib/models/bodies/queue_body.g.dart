// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueueBody _$QueueBodyFromJson(Map<String, dynamic> json) => QueueBody(
      context: json['context'] == null
          ? Context.defaultWeb
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      videoIds: (json['videoIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      playlistId: json['playlistId'] as String?,
    );

Map<String, dynamic> _$QueueBodyToJson(QueueBody instance) => <String, dynamic>{
      'context': instance.context.toJson(),
      'videoIds': instance.videoIds,
      'playlistId': instance.playlistId,
    };
