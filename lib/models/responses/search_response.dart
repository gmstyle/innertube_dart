import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';

class SearchResponse {
  List<Video>? videos;
  List<Channel>? channels;
  List<Playlist>? playlists;
  String? continuationToken;

  SearchResponse({
    this.videos,
    this.channels,
    this.playlists,
    this.continuationToken,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        videos:
            (json['videos'] as List<dynamic>?)?.map((e) => e as Video).toList(),
        channels: (json['channels'] as List<dynamic>?)
            ?.map((e) => e as Channel)
            .toList(),
        playlists: (json['playlists'] as List<dynamic>?)
            ?.map((e) => e as Playlist)
            .toList(),
        continuationToken: json['continuationToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'videos': videos?.map((e) => e).toList(),
        'channels': channels?.map((e) => e).toList(),
        'playlists': playlists?.map((e) => e).toList(),
        'continuationToken': continuationToken,
      };
}
