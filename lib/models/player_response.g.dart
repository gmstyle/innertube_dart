// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerResponse _$PlayerResponseFromJson(Map<String, dynamic> json) =>
    PlayerResponse(
      playabilityStatus: json['playabilityStatus'] == null
          ? null
          : PlayabilityStatus.fromJson(
              json['playabilityStatus'] as Map<String, dynamic>),
      streamingData: json['streamingData'] == null
          ? null
          : StreamingData.fromJson(
              json['streamingData'] as Map<String, dynamic>),
      playerConfig: json['playerConfig'] == null
          ? null
          : PlayerConfig.fromJson(json['playerConfig'] as Map<String, dynamic>),
      videoDetails: json['videoDetails'] == null
          ? null
          : VideoDetails.fromJson(json['videoDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerResponseToJson(PlayerResponse instance) =>
    <String, dynamic>{
      'playabilityStatus': instance.playabilityStatus?.toJson(),
      'streamingData': instance.streamingData?.toJson(),
      'playerConfig': instance.playerConfig?.toJson(),
      'videoDetails': instance.videoDetails?.toJson(),
    };

PlayabilityStatus _$PlayabilityStatusFromJson(Map<String, dynamic> json) =>
    PlayabilityStatus(
      playabilityStatus: json['playabilityStatus'] as String?,
    );

Map<String, dynamic> _$PlayabilityStatusToJson(PlayabilityStatus instance) =>
    <String, dynamic>{
      'playabilityStatus': instance.playabilityStatus,
    };

PlayerConfig _$PlayerConfigFromJson(Map<String, dynamic> json) => PlayerConfig(
      audioConfig: json['audioConfig'] == null
          ? null
          : AudioConfig.fromJson(json['audioConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerConfigToJson(PlayerConfig instance) =>
    <String, dynamic>{
      'audioConfig': instance.audioConfig?.toJson(),
    };

AudioConfig _$AudioConfigFromJson(Map<String, dynamic> json) => AudioConfig(
      loudnessDb: (json['loudnessDb'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AudioConfigToJson(AudioConfig instance) =>
    <String, dynamic>{
      'loudnessDb': instance.loudnessDb,
    };

StreamingData _$StreamingDataFromJson(Map<String, dynamic> json) =>
    StreamingData(
      adaptiveFormats: (json['adaptiveFormats'] as List<dynamic>?)
          ?.map((e) => AdaptiveFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StreamingDataToJson(StreamingData instance) =>
    <String, dynamic>{
      'adaptiveFormats':
          instance.adaptiveFormats?.map((e) => e.toJson()).toList(),
    };

AdaptiveFormat _$AdaptiveFormatFromJson(Map<String, dynamic> json) =>
    AdaptiveFormat(
      itag: json['itag'] as int,
      mimeType: json['mimeType'] as int,
      bitrate: (json['bitrate'] as num?)?.toDouble(),
      averageBitrate: (json['averageBitrate'] as num?)?.toDouble(),
      contentLength: (json['contentLength'] as num?)?.toDouble(),
      audioQuality: json['audioQuality'] as String?,
      approxDurationMs: (json['approxDurationMs'] as num?)?.toDouble(),
      lastModified: (json['lastModified'] as num?)?.toDouble(),
      loudnessDb: (json['loudnessDb'] as num?)?.toDouble(),
      audioSampleRate: json['audioSampleRate'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AdaptiveFormatToJson(AdaptiveFormat instance) =>
    <String, dynamic>{
      'itag': instance.itag,
      'mimeType': instance.mimeType,
      'bitrate': instance.bitrate,
      'averageBitrate': instance.averageBitrate,
      'contentLength': instance.contentLength,
      'audioQuality': instance.audioQuality,
      'approxDurationMs': instance.approxDurationMs,
      'lastModified': instance.lastModified,
      'loudnessDb': instance.loudnessDb,
      'audioSampleRate': instance.audioSampleRate,
      'url': instance.url,
    };

VideoDetails _$VideoDetailsFromJson(Map<String, dynamic> json) => VideoDetails(
      videoId: json['videoId'] as String?,
    );

Map<String, dynamic> _$VideoDetailsToJson(VideoDetails instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
    };
