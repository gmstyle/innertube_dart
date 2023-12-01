// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_panel_video_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistPanelVideoRenderer _$PlaylistPanelVideoRendererFromJson(
        Map<String, dynamic> json) =>
    PlaylistPanelVideoRenderer(
      title: json['title'] == null
          ? null
          : Runs.fromJson(json['title'] as Map<String, dynamic>),
      longByLineText: json['longByLineText'] == null
          ? null
          : Runs.fromJson(json['longByLineText'] as Map<String, dynamic>),
      shortByLineText: json['shortByLineText'] == null
          ? null
          : Runs.fromJson(json['shortByLineText'] as Map<String, dynamic>),
      lengthText: json['lengthText'] == null
          ? null
          : Runs.fromJson(json['lengthText'] as Map<String, dynamic>),
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistPanelVideoRendererToJson(
        PlaylistPanelVideoRenderer instance) =>
    <String, dynamic>{
      'title': instance.title,
      'longByLineText': instance.longByLineText,
      'shortByLineText': instance.shortByLineText,
      'lengthText': instance.lengthText,
      'navigationEndpoint': instance.navigationEndpoint,
      'thumbnail': instance.thumbnail,
    };
