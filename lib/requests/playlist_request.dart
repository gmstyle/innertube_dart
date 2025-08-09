import 'package:flutter/material.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/models/responses/playlist.dart' as local_models;
import 'package:innertube_dart/models/responses/video.dart' as local_models;
import 'package:innertube_dart/models/responses/thumbnail.dart' as local_models;

class PlaylistRequest extends InnertubeBase {
  final Locale? locale;

  PlaylistRequest({this.locale = const Locale('en', 'US')});

  // PlaylistResponseMapper non più necessario

  Future<local_models.Playlist> getPlaylist({
    required String playlistId,
    bool getVideos = true,
  }) async {
    final playlist = await yt.playlists.get(playlistId);
    final videos = <local_models.Video>[];
    if (getVideos) {
      await for (final video in yt.playlists.getVideos(playlistId)) {
        videos.add(
          local_models.Video(
            videoId: video.id.value,
            title: video.title,
            description: video.description,
            lengthSeconds: video.duration?.inSeconds.toString(),
            channelId: video.channelId.value,
            thumbnails: [
              local_models.Thumbnail(
                url: video.thumbnails.highResUrl,
                width: null,
                height: null,
              ),
            ],
            viewCount: video.engagement.viewCount.toString(),
            author: video.author.toString(),
            muxedStreamingUrl: null,
            durationMs: video.duration?.inMilliseconds.toString(),
          ),
        );
      }
    }
    yt.close();
    return local_models.Playlist(
      playlistId: playlist.id.value,
      title: playlist.title,
      description: playlist.description,
      thumbnails: [
        local_models.Thumbnail(
          url: playlist.thumbnails.highResUrl,
          width: null,
          height: null,
        ),
      ],
      author: playlist.author,
      videoCount: playlist.videoCount?.toString(),
      videos: videos,
    );
  }
}
