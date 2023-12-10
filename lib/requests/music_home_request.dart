import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/mappers/music_home_response_mapper.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/requests/playlist_request.dart';
import 'package:innertube_dart/requests/video_request.dart';
import 'package:innertube_dart/utils/utils.dart';

class MusicHomeRequest extends InnertubeBase {
  final Locale? locale;

  MusicHomeRequest({this.locale = const Locale('en', 'US')});

  final MusicHomeResponseMapper _musicHomeResponseMapper =
      MusicHomeResponseMapper();

  Future<MusicHomeResponse> getMusicHome() async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': ExploreSection.music.browseId,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    final metadata = response['metadata']['channelMetadataRenderer'];
    final carouselItems = response['header']['carouselHeaderRenderer']
            ['contents'][0]['carouselItemRenderer']['carouselItems']
        as List<dynamic>;
    final sectionList = response['contents']['twoColumnBrowseResultsRenderer']
            ['tabs'][0]['tabRenderer']['content']['sectionListRenderer']
        ['contents'];

    final List<dynamic> sections = Utils.filterMusicContents(sectionList);

    final newSections = [];
    for (final section in sections) {
      final newSection = {
        'title': section['title'],
        'videos': [],
        'playlists': []
      };
      for (final content in section['contents']) {
        if (content['gridVideoRenderer'] != null) {
          final videoId = content['gridVideoRenderer']['videoId'];
          final video =
              await VideoRequest(locale: locale).getVideo(videoId: videoId);
          newSection['videos'].add(video);
        }

        if (content['gridPlaylistRenderer'] != null) {
          final playlistId = Utils.setPlaylistId(
              content['gridPlaylistRenderer']['playlistId']);
          final playlist = await PlaylistRequest(locale: locale)
              .getPlaylist(playlistId: playlistId!, getVideos: false);
          newSection['playlists'].add(playlist);
        }
      }
      newSections.add(newSection);
    }

    final List<Video> newCarouselIVideos = [];
    for (final carouselItem in carouselItems) {
      final videoId = carouselItem['defaultPromoPanelRenderer']
          ['navigationEndpoint']['watchEndpoint']['videoId'];
      final video =
          await VideoRequest(locale: locale).getVideo(videoId: videoId);
      newCarouselIVideos.add(video);
    }

    final data = {
      'metadata': metadata,
      'carouselVideos': newCarouselIVideos,
      'sections': newSections,
    };

    return _musicHomeResponseMapper.toModel(data);
  }
}
