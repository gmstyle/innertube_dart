// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_carousel_shelf_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusciCarouselShelfRenderer _$MusciCarouselShelfRendererFromJson(
        Map<String, dynamic> json) =>
    MusciCarouselShelfRenderer(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MusciCarouselShelfRendererToJson(
        MusciCarouselShelfRenderer instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'contents': instance.contents?.map((e) => e.toJson()).toList(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      musicTwoRowItemRenderer: json['musicTwoRowItemRenderer'] == null
          ? null
          : MusicTwoRowItemRenderer.fromJson(
              json['musicTwoRowItemRenderer'] as Map<String, dynamic>),
      musicResponsiveListItemRenderer:
          json['musicResponsiveListItemRenderer'] == null
              ? null
              : MusicResponsiveListItemRenderer.fromJson(
                  json['musicResponsiveListItemRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'musicTwoRowItemRenderer': instance.musicTwoRowItemRenderer?.toJson(),
      'musicResponsiveListItemRenderer':
          instance.musicResponsiveListItemRenderer?.toJson(),
    };

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      musicTwoRowItemRenderer: json['musicTwoRowItemRenderer'] == null
          ? null
          : MusicTwoRowItemRenderer.fromJson(
              json['musicTwoRowItemRenderer'] as Map<String, dynamic>),
      musicResponsiveListItemRenderer:
          json['musicResponsiveListItemRenderer'] == null
              ? null
              : MusicResponsiveListItemRenderer.fromJson(
                  json['musicResponsiveListItemRenderer']
                      as Map<String, dynamic>),
      musicCarouselShelfBasicHeaderRenderer:
          json['musicCarouselShelfBasicHeaderRenderer'] == null
              ? null
              : MusicCarouselShelfBasicHeaderRenderer.fromJson(
                  json['musicCarouselShelfBasicHeaderRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'musicTwoRowItemRenderer': instance.musicTwoRowItemRenderer?.toJson(),
      'musicResponsiveListItemRenderer':
          instance.musicResponsiveListItemRenderer?.toJson(),
      'musicCarouselShelfBasicHeaderRenderer':
          instance.musicCarouselShelfBasicHeaderRenderer?.toJson(),
    };

MusicCarouselShelfBasicHeaderRenderer
    _$MusicCarouselShelfBasicHeaderRendererFromJson(
            Map<String, dynamic> json) =>
        MusicCarouselShelfBasicHeaderRenderer(
          moreContentButton: json['moreContentButton'] == null
              ? null
              : MoreContentButton.fromJson(
                  json['moreContentButton'] as Map<String, dynamic>),
          title: json['title'] == null
              ? null
              : Runs.fromJson(json['title'] as Map<String, dynamic>),
          strapline: json['strapline'] == null
              ? null
              : Runs.fromJson(json['strapline'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MusicCarouselShelfBasicHeaderRendererToJson(
        MusicCarouselShelfBasicHeaderRenderer instance) =>
    <String, dynamic>{
      'moreContentButton': instance.moreContentButton?.toJson(),
      'title': instance.title?.toJson(),
      'strapline': instance.strapline?.toJson(),
    };

MoreContentButton _$MoreContentButtonFromJson(Map<String, dynamic> json) =>
    MoreContentButton(
      buttonRenderer: json['buttonRenderer'] == null
          ? null
          : ButtonRenderer.fromJson(
              json['buttonRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoreContentButtonToJson(MoreContentButton instance) =>
    <String, dynamic>{
      'buttonRenderer': instance.buttonRenderer?.toJson(),
    };
