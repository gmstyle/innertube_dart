import 'package:innertube_dart/models/thumbnail.dart';

class ThumbnailRenderer {
  final MusciThumbnailRenderer? musicThumbnailRenderer;

  ThumbnailRenderer({this.musicThumbnailRenderer});

  factory ThumbnailRenderer.fromJson(Map<String, dynamic> json) {
    return ThumbnailRenderer(
      musicThumbnailRenderer: json['croppedSquareThumbnailRenderer'] != null
          ? MusciThumbnailRenderer.fromJson(
              json['croppedSquareThumbnailRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.musicThumbnailRenderer != null) {
      data['croppedSquareThumbnailRenderer'] =
          this.musicThumbnailRenderer!.toJson();
    }
    return data;
  }
}

class MusciThumbnailRenderer {
  final Thumbnail? thumbnail;

  MusciThumbnailRenderer({this.thumbnail});

  factory MusciThumbnailRenderer.fromJson(Map<String, dynamic> json) {
    return MusciThumbnailRenderer(
      thumbnail: json['thumbnail'] != null
          ? Thumbnail.fromJson(json['thumbnail'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    return data;
  }
}
