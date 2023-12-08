import 'package:innertube_dart/models/responses/video.dart';

class PlaylistResponse {
  String? playlistId;
  String? title;
  String? description;
  String? thumbnailUrl;
  String? author;
  String? videoCount;
  List<Video>? videos;

  PlaylistResponse({
    this.playlistId,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.author,
    this.videoCount,
    this.videos,
  });

  PlaylistResponse.fromJson(Map<String, dynamic> json) {
    playlistId = json['playlistId'];
    title = json['title'];
    description = json['description'];
    thumbnailUrl = json['thumbnailUrl'];
    author = json['author'];
    videoCount = json['videoCount'];
    if (json['videos'] != null) {
      videos = <Video>[];
      json['videos'].forEach((v) {
        videos!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['playlistId'] = playlistId;
    data['title'] = title;
    data['description'] = description;
    data['thumbnailUrl'] = thumbnailUrl;
    data['author'] = author;
    data['videoCount'] = videoCount;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
