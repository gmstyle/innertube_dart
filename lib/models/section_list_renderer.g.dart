// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_list_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionListRenderer _$SectionListRendererFromJson(Map<String, dynamic> json) =>
    SectionListRenderer(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      continuations: (json['continuations'] as List<dynamic>?)
          ?.map((e) => Continuation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionListRendererToJson(
        SectionListRenderer instance) =>
    <String, dynamic>{
      'contents': instance.contents?.map((e) => e.toJson()).toList(),
      'continuations': instance.continuations?.map((e) => e.toJson()).toList(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      musicCarouselShelfRenderer: json['musicCarouselShelfRenderer'] == null
          ? null
          : MusciCarouselShelfRenderer.fromJson(
              json['musicCarouselShelfRenderer'] as Map<String, dynamic>),
      musicShelfRenderer: json['musicShelfRenderer'] == null
          ? null
          : MusicShelfRenderer.fromJson(
              json['musicShelfRenderer'] as Map<String, dynamic>),
      gridRenderer: json['gridRenderer'] == null
          ? null
          : GridRenderer.fromJson(json['gridRenderer'] as Map<String, dynamic>),
      musicDescriptionShelfRenderer: json['musicDescriptionShelfRenderer'] ==
              null
          ? null
          : MusicDescriptionShelfRenderer.fromJson(
              json['musicDescriptionShelfRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'musicCarouselShelfRenderer':
          instance.musicCarouselShelfRenderer?.toJson(),
      'musicShelfRenderer': instance.musicShelfRenderer?.toJson(),
      'gridRenderer': instance.gridRenderer?.toJson(),
      'musicDescriptionShelfRenderer':
          instance.musicDescriptionShelfRenderer?.toJson(),
    };

MusicDescriptionShelfRenderer _$MusicDescriptionShelfRendererFromJson(
        Map<String, dynamic> json) =>
    MusicDescriptionShelfRenderer(
      description: json['description'] == null
          ? null
          : Runs.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicDescriptionShelfRendererToJson(
        MusicDescriptionShelfRenderer instance) =>
    <String, dynamic>{
      'description': instance.description?.toJson(),
    };
