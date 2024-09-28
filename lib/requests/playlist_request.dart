import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/mappers/playlist_response_mapper.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/requests/video_request.dart';
import 'package:innertube_dart/utils/utils.dart';

class PlaylistRequest extends InnertubeBase {
  final Locale? locale;

  PlaylistRequest({this.locale = const Locale('en', 'US')});

  final PlaylistResponseMapper _playlistResponseMapper =
      PlaylistResponseMapper();

  Future<Playlist> getPlaylist(
      {required String playlistId,
      String? continuationToken,
      bool getVideos = true}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': playlistId,
      'continuation': continuationToken,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);
    final List<dynamic> playlistVideoListRenderer = response['contents']
                    ['twoColumnBrowseResultsRenderer']['tabs'][0]['tabRenderer']
                ['content']['sectionListRenderer']['contents'][0]
            ['itemSectionRenderer']['contents'][0]['playlistVideoListRenderer']
        ['contents'];

    final videoIds = <String>[];
    for (final item in playlistVideoListRenderer) {
      if (item['playlistVideoRenderer'] != null) {
        videoIds.add(item['playlistVideoRenderer']['videoId']);
      }
    }
    List<Video> videos = [];
    if (getVideos) {
      final videoRequests = videoIds.map(
          (videoId) => VideoRequest(locale: locale).getVideo(videoId: videoId));
      videos = await Future.wait(videoRequests);
    }

    //videos.removeWhere((element) => element.muxedStreamingUrl == null);

    final playlistData = response['header']['playlistHeaderRenderer'] ??
        response['header']['pageHeaderRenderer'];

    final data = {"playlistData": playlistData, "videos": videos};

    return _playlistResponseMapper.toModel(data);
  }
}
