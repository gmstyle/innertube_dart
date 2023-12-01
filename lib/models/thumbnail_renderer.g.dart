// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail_renderer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailRenderer _$ThumbnailRendererFromJson(Map<String, dynamic> json) =>
    ThumbnailRenderer(
      musicThumbnailRenderer: json['musicThumbnailRenderer'] == null
          ? null
          : MusciThumbnailRenderer.fromJson(
              json['musicThumbnailRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailRendererToJson(ThumbnailRenderer instance) =>
    <String, dynamic>{
      'musicThumbnailRenderer': instance.musicThumbnailRenderer,
    };

MusciThumbnailRenderer _$MusciThumbnailRendererFromJson(
        Map<String, dynamic> json) =>
    MusciThumbnailRenderer(
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusciThumbnailRendererToJson(
        MusciThumbnailRenderer instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      thumbnails: (json['thumbnails'] as List<dynamic>)
          .map((e) => thumbnail.Thumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'thumbnails': instance.thumbnails,
    };
