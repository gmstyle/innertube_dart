// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_responsive_list_item_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicResponsiveListItemRenderer _$MusicResponsiveListItemRendererFromJson(
        Map<String, dynamic> json) =>
    MusicResponsiveListItemRenderer(
      fixedColumns: (json['fixedColumns'] as List<dynamic>?)
          ?.map((e) => FlexColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      flexColumns: (json['flexColumns'] as List<dynamic>?)
          ?.map((e) => FlexColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] == null
          ? null
          : ThumbnailRenderer.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicResponsiveListItemRendererToJson(
        MusicResponsiveListItemRenderer instance) =>
    <String, dynamic>{
      'fixedColumns': instance.fixedColumns?.map((e) => e.toJson()).toList(),
      'flexColumns': instance.flexColumns?.map((e) => e.toJson()).toList(),
      'thumbnail': instance.thumbnail?.toJson(),
      'navigationEndpoint': instance.navigationEndpoint?.toJson(),
    };

FlexColumn _$FlexColumnFromJson(Map<String, dynamic> json) => FlexColumn(
      musicResponsiveListItemFlexColumnRenderer:
          json['musicResponsiveListItemFlexColumnRenderer'] == null
              ? null
              : MusicResponsiveListItemFlexColumnRenderer.fromJson(
                  json['musicResponsiveListItemFlexColumnRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlexColumnToJson(FlexColumn instance) =>
    <String, dynamic>{
      'musicResponsiveListItemFlexColumnRenderer':
          instance.musicResponsiveListItemFlexColumnRenderer?.toJson(),
    };

MusicResponsiveListItemFlexColumnRenderer
    _$MusicResponsiveListItemFlexColumnRendererFromJson(
            Map<String, dynamic> json) =>
        MusicResponsiveListItemFlexColumnRenderer(
          text: json['text'] == null
              ? null
              : Runs.fromJson(json['text'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MusicResponsiveListItemFlexColumnRendererToJson(
        MusicResponsiveListItemFlexColumnRenderer instance) =>
    <String, dynamic>{
      'text': instance.text?.toJson(),
    };
