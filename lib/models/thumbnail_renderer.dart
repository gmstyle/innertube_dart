import 'package:innertube_dart/models/thumbnail.dart' as thumbnail;
import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class ThumbnailRenderer {
  final MusciThumbnailRenderer? musicThumbnailRenderer;

  ThumbnailRenderer({this.musicThumbnailRenderer});

  factory ThumbnailRenderer.fromJson(Map<String, dynamic> json) {
    json['musicThumbnailRenderer'] ??= json['croppedSquareThumbnailRenderer'];
    return _$ThumbnailRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ThumbnailRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class MusciThumbnailRenderer {
  final Thumbnail? thumbnail;

  MusciThumbnailRenderer({this.thumbnail});

  factory MusciThumbnailRenderer.fromJson(Map<String, dynamic> json) {
    return _$MusciThumbnailRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusciThumbnailRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Thumbnail {
  final List<thumbnail.Thumbnail> thumbnails;

  Thumbnail({required this.thumbnails});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return _$ThumbnailFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ThumbnailToJson(this);
  }
}
