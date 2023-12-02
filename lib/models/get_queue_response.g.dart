// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_queue_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQueueResponse _$GetQueueResponseFromJson(Map<String, dynamic> json) =>
    GetQueueResponse(
      (json['queueDatas'] as List<dynamic>?)
          ?.map((e) => QueueData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQueueResponseToJson(GetQueueResponse instance) =>
    <String, dynamic>{
      'queueDatas': instance.queueDatas?.map((e) => e.toJson()).toList(),
    };

QueueData _$QueueDataFromJson(Map<String, dynamic> json) => QueueData(
      PlaylistPanelRendererContent.fromJson(
          json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueueDataToJson(QueueData instance) => <String, dynamic>{
      'content': instance.content.toJson(),
    };
