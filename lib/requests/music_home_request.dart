import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/mappers/music_home_response_mapper.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
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
        'playlists': [],
      };

      final videoRequests = <Future<Video>>[];
      final playlistRequests = <Future<Playlist>>[];
      final videoIds = <String>[];
      final playlistIds = <String>[];

      for (final content in section['contents']) {
        if (content['gridVideoRenderer'] != null) {
          final videoId = content['gridVideoRenderer']['videoId'];
          videoIds.add(videoId);
        }

        if (content['gridPlaylistRenderer'] != null ||
            content['compactStationRenderer'] != null) {
          final playlistId = Utils.setPlaylistId(
              content['gridPlaylistRenderer'] != null
                  ? content['gridPlaylistRenderer']['playlistId']
                  : content['compactStationRenderer']['navigationEndpoint']
                      ['watchPlaylistEndpoint']['playlistId']);
          playlistIds.add(playlistId!);
        }

        if (content['lockupViewModel'] != null) {
          if (content['lockupViewModel']['contentType'] ==
              'LOCKUP_CONTENT_TYPE_ALBUM') {
            final playlistId =
                Utils.setPlaylistId(content['lockupViewModel']['contentId']);
            playlistIds.add(playlistId!);
          }
        }
      }

      videoRequests.addAll(videoIds.map((id) => VideoRequest(locale: locale)
          .getVideo(videoId: id, withStreamingUrl: false)));
      playlistRequests.addAll(playlistIds.map((id) =>
          PlaylistRequest(locale: locale)
              .getPlaylist(playlistId: id, getVideos: false)));

      newSection['videos'] = await Future.wait(videoRequests);
      newSection['playlists'] = await Future.wait(playlistRequests);
      newSections.add(newSection);
    }

    final carouselVideoRequests = carouselItems.map((carouselItem) =>
        VideoRequest(locale: locale).getVideo(
            videoId: carouselItem['defaultPromoPanelRenderer']
                ['navigationEndpoint']['watchEndpoint']['videoId'],
            withStreamingUrl: false));

    final newCarouselIVideos =
        await Future.wait(carouselVideoRequests.toList());

    final data = {
      'metadata': metadata,
      'carouselVideos': newCarouselIVideos,
      'sections': newSections,
    };

    return _musicHomeResponseMapper.toModel(data);
  }
}
