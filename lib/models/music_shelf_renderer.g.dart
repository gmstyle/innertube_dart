// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_shelf_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicShelfRenderer _$MusicShelfRendererFromJson(Map<String, dynamic> json) =>
    MusicShelfRenderer(
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      continuations: (json['continuations'] as List<dynamic>?)
              ?.map((e) => Continuation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] == null
          ? null
          : Runs.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicShelfRendererToJson(MusicShelfRenderer instance) =>
    <String, dynamic>{
      'navigationEndpoint': instance.navigationEndpoint?.toJson(),
      'contents': instance.contents?.map((e) => e.toJson()).toList(),
      'continuations': instance.continuations.map((e) => e.toJson()).toList(),
      'title': instance.title?.toJson(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      musicResponsiveListItemRenderer:
          json['musicResponsiveListItemRenderer'] == null
              ? null
              : MusicResponsiveListItemRenderer.fromJson(
                  json['musicResponsiveListItemRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'musicResponsiveListItemRenderer':
          instance.musicResponsiveListItemRenderer?.toJson(),
    };
