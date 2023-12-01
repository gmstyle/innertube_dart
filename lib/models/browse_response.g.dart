// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowseResponse _$BrowseResponseFromJson(Map<String, dynamic> json) =>
    BrowseResponse(
      json['contents'] == null
          ? null
          : Contents.fromJson(json['contents'] as Map<String, dynamic>),
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      json['microformat'] == null
          ? null
          : Microformat.fromJson(json['microformat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseResponseToJson(BrowseResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents?.toJson(),
      'header': instance.header?.toJson(),
      'microformat': instance.microformat?.toJson(),
    };

Contents _$ContentsFromJson(Map<String, dynamic> json) => Contents(
      json['singleColumnBrowseResultsRenderer'] == null
          ? null
          : Tabs.fromJson(json['singleColumnBrowseResultsRenderer']
              as Map<String, dynamic>),
      json['sectionListRenderer'] == null
          ? null
          : SectionListRenderer.fromJson(
              json['sectionListRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentsToJson(Contents instance) => <String, dynamic>{
      'singleColumnBrowseResultsRenderer':
          instance.singleColumnBrowseResultsRenderer?.toJson(),
      'sectionListRenderer': instance.sectionListRenderer?.toJson(),
    };

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
      json['musicImmersiveHeaderRenderer'] == null
          ? null
          : MusicImmersiveHeaderRenderer.fromJson(
              json['musicImmersiveHeaderRenderer'] as Map<String, dynamic>),
      json['musicDetailHeaderRenderer'] == null
          ? null
          : MusicDetailHeaderRenderer.fromJson(
              json['musicDetailHeaderRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'musicImmersiveHeaderRenderer':
          instance.musicImmersiveHeaderRenderer?.toJson(),
      'musicDetailHeaderRenderer': instance.musicDetailHeaderRenderer?.toJson(),
    };

MusicDetailHeaderRenderer _$MusicDetailHeaderRendererFromJson(
        Map<String, dynamic> json) =>
    MusicDetailHeaderRenderer(
      json['title'] == null
          ? null
          : Runs.fromJson(json['title'] as Map<String, dynamic>),
      json['subtitle'] == null
          ? null
          : Runs.fromJson(json['subtitle'] as Map<String, dynamic>),
      json['secondSubtitle'] == null
          ? null
          : Runs.fromJson(json['secondSubtitle'] as Map<String, dynamic>),
      json['thumbnail'] == null
          ? null
          : ThumbnailRenderer.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicDetailHeaderRendererToJson(
        MusicDetailHeaderRenderer instance) =>
    <String, dynamic>{
      'title': instance.title?.toJson(),
      'subtitle': instance.subtitle?.toJson(),
      'secondSubtitle': instance.secondSubtitle?.toJson(),
      'thumbnail': instance.thumbnail?.toJson(),
    };

MusicImmersiveHeaderRenderer _$MusicImmersiveHeaderRendererFromJson(
        Map<String, dynamic> json) =>
    MusicImmersiveHeaderRenderer(
      json['description'] == null
          ? null
          : Runs.fromJson(json['description'] as Map<String, dynamic>),
      json['playButton'] == null
          ? null
          : PlayButton.fromJson(json['playButton'] as Map<String, dynamic>),
      json['startRadioButton'] == null
          ? null
          : StartRadioButton.fromJson(
              json['startRadioButton'] as Map<String, dynamic>),
      json['thumbnail'] == null
          ? null
          : ThumbnailRenderer.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
      json['foregroundThumbnail'] == null
          ? null
          : ThumbnailRenderer.fromJson(
              json['foregroundThumbnail'] as Map<String, dynamic>),
      json['title'] == null
          ? null
          : Runs.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicImmersiveHeaderRendererToJson(
        MusicImmersiveHeaderRenderer instance) =>
    <String, dynamic>{
      'description': instance.description?.toJson(),
      'playButton': instance.playButton?.toJson(),
      'startRadioButton': instance.startRadioButton?.toJson(),
      'thumbnail': instance.thumbnail?.toJson(),
      'foregroundThumbnail': instance.foregroundThumbnail?.toJson(),
      'title': instance.title?.toJson(),
    };

PlayButton _$PlayButtonFromJson(Map<String, dynamic> json) => PlayButton(
      json['buttonRenderer'] == null
          ? null
          : ButtonRenderer.fromJson(
              json['buttonRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayButtonToJson(PlayButton instance) =>
    <String, dynamic>{
      'buttonRenderer': instance.buttonRenderer?.toJson(),
    };

StartRadioButton _$StartRadioButtonFromJson(Map<String, dynamic> json) =>
    StartRadioButton(
      json['buttonRenderer'] == null
          ? null
          : ButtonRenderer.fromJson(
              json['buttonRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartRadioButtonToJson(StartRadioButton instance) =>
    <String, dynamic>{
      'buttonRenderer': instance.buttonRenderer?.toJson(),
    };

Microformat _$MicroformatFromJson(Map<String, dynamic> json) => Microformat(
      json['microformatDataRenderer'] == null
          ? null
          : MicroformatDataRenderer.fromJson(
              json['microformatDataRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MicroformatToJson(Microformat instance) =>
    <String, dynamic>{
      'microformatDataRenderer': instance.microformatDataRenderer?.toJson(),
    };

MicroformatDataRenderer _$MicroformatDataRendererFromJson(
        Map<String, dynamic> json) =>
    MicroformatDataRenderer(
      json['urlCanonical'] as String?,
    );

Map<String, dynamic> _$MicroformatDataRendererToJson(
        MicroformatDataRenderer instance) =>
    <String, dynamic>{
      'urlCanonical': instance.urlCanonical,
    };
