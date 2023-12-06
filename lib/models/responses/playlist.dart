import 'package:innertube_dart/models/responses/video.dart';

class Playlist {
  String? playlistId;
  String? title;
  String? description;
  List<Map<String, dynamic>>? thumbnails;
  String? videoCount;
  List<Video>? videos;

  Playlist({
    this.playlistId,
    this.title,
    this.description,
    this.thumbnails,
    this.videoCount,
    this.videos,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        playlistId: json['playlistId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        thumbnails: (json['thumbnails'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        videoCount: json['videoCount'] as String?,
        videos:
            (json['videos'] as List<dynamic>?)?.map((e) => e as Video).toList(),
      );

  Map<String, dynamic> toJson() => {
        'playlistId': playlistId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.map((e) => e).toList(),
        'videoCount': videoCount,
        'videos': videos?.map((e) => e).toList(),
      };
}
