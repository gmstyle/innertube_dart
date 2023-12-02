// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextBody _$NextBodyFromJson(Map<String, dynamic> json) => NextBody(
      context: json['context'] == null
          ? Context.defaultWeb
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      videoId: json['videoId'] as String?,
      isAudioOnly: json['isAudioOnly'] as bool? ?? true,
      playlistId: json['playlistId'] as String?,
      tunerSettingValue:
          json['tunerSettingValue'] as String? ?? "AUTOMIX_SETTING_NORMAL",
      index: json['index'] as int?,
      params: json['params'] as String?,
      playlistSetVideoId: json['playlistSetVideoId'] as String?,
      watchEndpointMusicSupportedConfigs:
          json['watchEndpointMusicSupportedConfigs'] == null
              ? const WatchEndpointMusicSupportedConfigs(
                  musicVideoType: "MUSIC_VIDEO_TYPE_ATV")
              : WatchEndpointMusicSupportedConfigs.fromJson(
                  json['watchEndpointMusicSupportedConfigs']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$NextBodyToJson(NextBody instance) => <String, dynamic>{
      'context': instance.context.toJson(),
      'videoId': instance.videoId,
      'isAudioOnly': instance.isAudioOnly,
      'playlistId': instance.playlistId,
      'tunerSettingValue': instance.tunerSettingValue,
      'index': instance.index,
      'params': instance.params,
      'playlistSetVideoId': instance.playlistSetVideoId,
      'watchEndpointMusicSupportedConfigs':
          instance.watchEndpointMusicSupportedConfigs.toJson(),
    };

WatchEndpointMusicSupportedConfigs _$WatchEndpointMusicSupportedConfigsFromJson(
        Map<String, dynamic> json) =>
    WatchEndpointMusicSupportedConfigs(
      musicVideoType: json['musicVideoType'] as String,
    );

Map<String, dynamic> _$WatchEndpointMusicSupportedConfigsToJson(
        WatchEndpointMusicSupportedConfigs instance) =>
    <String, dynamic>{
      'musicVideoType': instance.musicVideoType,
    };
