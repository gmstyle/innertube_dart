// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_two_row_item_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicTwoRowItemRenderer _$MusicTwoRowItemRendererFromJson(
        Map<String, dynamic> json) =>
    MusicTwoRowItemRenderer(
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      thumbnailRenderer: json['thumbnailRenderer'] == null
          ? null
          : ThumbnailRenderer.fromJson(
              json['thumbnailRenderer'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : Runs.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: json['subtitle'] == null
          ? null
          : Runs.fromJson(json['subtitle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicTwoRowItemRendererToJson(
        MusicTwoRowItemRenderer instance) =>
    <String, dynamic>{
      'navigationEndpoint': instance.navigationEndpoint,
      'thumbnailRenderer': instance.thumbnailRenderer,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };
