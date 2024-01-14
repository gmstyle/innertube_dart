import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';

class Section {
  String? title;
  String? playlistId;
  List<Video>? videos;
  List<Playlist>? playlists;
  List<Channel>? featuredChannels;

  Section({
    this.title,
    this.playlistId,
    this.videos,
    this.playlists,
    this.featuredChannels,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      playlistId: json['playlistId'],
      videos: (json['videos'] as List<dynamic>).map<Video>((e) => e).toList(),
      playlists:
          (json['playlists'] as List<dynamic>).map<Playlist>((e) => e).toList(),
      featuredChannels: json['featuredChannels'] != null
          ? (json['featuredChannels'] as List<dynamic>)
              .map<Channel>((e) => e)
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'playlistId': playlistId,
      'videos': videos?.map((e) => e.toJson()).toList(),
      'playlists': playlists?.map((e) => e.toJson()).toList(),
      'featuredChannels': featuredChannels?.map((e) => e.toJson()).toList(),
    };
  }
}
