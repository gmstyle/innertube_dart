import 'package:innertube_dart/models/responses/video/video.dart';

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

class Channel {
  String? channelId;
  String? title;
  String? description;
  List<Map<String, dynamic>>? thumbnails;
  String? videoCount;
  String? subscriberCount;

  Channel({
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.videoCount,
    this.subscriberCount,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        channelId: json['channelId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        thumbnails: (json['thumbnails'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        videoCount: json['videoCount'] as String?,
        subscriberCount: json['subscriberCount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.map((e) => e).toList(),
        'videoCount': videoCount,
        'subscriberCount': subscriberCount,
      };
}

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
