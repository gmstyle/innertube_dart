import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';

class Channel {
  final String? channelId;
  final String? title;
  final String? description;
  final String? channelHandleText;
  final List<dynamic>? avatars;
  final List<dynamic>? banners;
  final List<dynamic>? thumbnails;
  final List<dynamic>? tvBanners;
  final List<dynamic>? sections;
  final List<Video>? videos;
  final List<Playlist>? playlists;
  final String? videoCount;
  final String? subscriberCount;
  final String? continuationToken;

  Channel({
    this.channelId,
    this.title,
    this.description,
    this.channelHandleText,
    this.avatars,
    this.banners,
    this.thumbnails,
    this.tvBanners,
    this.sections,
    this.videos,
    this.playlists,
    this.videoCount,
    this.subscriberCount,
    this.continuationToken,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        channelId: json['channelId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        channelHandleText: json['channelHandleText'] as String?,
        avatars: (json['avatars'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        thumbnails: (json['thumbnails'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        tvBanners: (json['tvBanners'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        sections: (json['contents'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        videos:
            (json['videos'] as List<dynamic>?)?.map((e) => e as Video).toList(),
        playlists: (json['playlists'] as List<dynamic>?)
            ?.map((e) => e as Playlist)
            .toList(),
        videoCount: json['videoCount'] as String?,
        subscriberCount: json['subscriberCount'] as String?,
        continuationToken: json['continuationToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'channelId': channelId,
        'title': title,
        'description': description,
        'channelHandleText': channelHandleText,
        'avatars': avatars?.map((e) => e).toList(),
        'banners': banners?.map((e) => e).toList(),
        'thumbnails': thumbnails?.map((e) => e).toList(),
        'tvBanners': tvBanners?.map((e) => e).toList(),
        'contents': sections?.map((e) => e).toList(),
        'videos': videos?.map((e) => e).toList(),
        'playlists': playlists?.map((e) => e).toList(),
        'videoCount': videoCount,
        'subscriberCount': subscriberCount,
        'continuationToken': continuationToken,
      };
}
