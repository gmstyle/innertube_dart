// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_carousel_shelf_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusciCarouselShelfRenderer _$MusciCarouselShelfRendererFromJson(
        Map<String, dynamic> json) =>
    MusciCarouselShelfRenderer();

Map<String, dynamic> _$MusciCarouselShelfRendererToJson(
        MusciCarouselShelfRenderer instance) =>
    <String, dynamic>{};

Content _$ContentFromJson(Map<String, dynamic> json) => Content();

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{};

Header _$HeaderFromJson(Map<String, dynamic> json) => Header();

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{};

MusicCarouselShelfBasicHeaderRenderer
    _$MusicCarouselShelfBasicHeaderRendererFromJson(
            Map<String, dynamic> json) =>
        MusicCarouselShelfBasicHeaderRenderer();

Map<String, dynamic> _$MusicCarouselShelfBasicHeaderRendererToJson(
        MusicCarouselShelfBasicHeaderRenderer instance) =>
    <String, dynamic>{};

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
