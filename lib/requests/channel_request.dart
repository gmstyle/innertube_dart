import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/channel_response_mapper.dart';
import 'package:innertube_dart/mappers/playlist_renderer_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/requests/playlist_request.dart';
import 'package:innertube_dart/requests/video_request.dart';
import 'package:innertube_dart/utils/utils.dart';

class ChannelRequest extends InnertubeAdaptor {
  final Locale? locale;

  ChannelRequest({this.locale = const Locale('en', 'US')});

  final ChannelResponseMapper _channelResponseMapper = ChannelResponseMapper();
  final PlaylistRendererMapper _playlistRendererMapper =
      PlaylistRendererMapper();

  Future<Channel> getChannel(
      {required String channelId,
      ChannelSection channelSection = ChannelSection.home,
      String? continuationToken}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': channelId,
      'continuation': continuationToken,
      'params': channelSection.param
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    switch (channelSection) {
      case ChannelSection.home:
        return _getChannelHome(response);
      case ChannelSection.videos:
        return _getChannelVideos(response);
      case ChannelSection.playlists:
        return _getChannelPlaylists(response);
      default:
        return _getChannelHome(response);
    }
  }

  Future<Channel> _getChannelHome(Map<String, dynamic> response) async {
    final header = response['header']['c4TabbedHeaderRenderer'];
    final metadata = response['metadata']['channelMetadataRenderer'];
    String? continuationToken;

    final List<dynamic> sectionList = response['contents']
            ['twoColumnBrowseResultsRenderer']['tabs'][0]['tabRenderer']
        ['content']['sectionListRenderer']['contents'];

    // Filter the contents to get only the sections with shelfRenderer.
    final sections = Utils.filterChannelContents(sectionList);

    // Iterate over each section and get the videos and playlists.
    final List<dynamic> newSections = [];
    for (final section in sections) {
      final newSection = {
        'title': section['title'],
        'playlistId': section['playlistId'],
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

        if (content['continuationItemRenderer'] != null) {
          continuationToken = content['continuationItemRenderer']
              ['continuationEndpoint']['continuationCommand']['token'];
        }
      }
      newSections.add(newSection);
    }

    final data = {
      "header": header,
      'metadata': metadata,
      "sections": newSections,
      'continuationToken': continuationToken
    };

    return _channelResponseMapper.toModel(data);
  }

  Future<Channel> _getChannelVideos(Map<String, dynamic> response) async {
    final header = response['header']['c4TabbedHeaderRenderer'];
    final metadata = response['metadata']['channelMetadataRenderer'];
    String? continuationToken;

    final List<dynamic> items = response['contents']
            ['twoColumnBrowseResultsRenderer']['tabs'][1]['tabRenderer']
        ['content']['richGridRenderer']['contents'];

    final List<Video> videos = [];
    for (final item in items) {
      if (item['richItemRenderer'] != null) {
        final videoId =
            item['richItemRenderer']['content']['videoRenderer']['videoId'];
        final video =
            await VideoRequest(locale: locale).getVideo(videoId: videoId);
        videos.add(video);
      }

      if (item['continuationItemRenderer'] != null) {
        continuationToken = item['continuationItemRenderer']
            ['continuationEndpoint']['continuationCommand']['token'];
      }
    }

    final data = {
      "header": header,
      'metadata': metadata,
      "videos": videos,
      'continuationToken': continuationToken
    };

    return _channelResponseMapper.toModel(data);
  }

  Future<Channel> _getChannelPlaylists(Map<String, dynamic> response) async {
    final header = response['header']['c4TabbedHeaderRenderer'];
    final metadata = response['metadata']['channelMetadataRenderer'];
    String? continuationToken;

    final List<dynamic> items = response['contents']
                ['twoColumnBrowseResultsRenderer']['tabs'][4]['tabRenderer']
            ['content']['sectionListRenderer']['contents'][0]
        ['itemSectionRenderer']['contents'][0]['gridRenderer']['items'];

    final List<Playlist> playlists = [];
    for (final item in items) {
      if (item['gridPlaylistRenderer'] != null) {
        final playlist = _playlistRendererMapper.toModel(item);
        playlists.add(playlist);
      }

      if (item['continuationItemRenderer'] != null) {
        continuationToken = item['continuationItemRenderer']
            ['continuationEndpoint']['continuationCommand']['token'];
      }
    }

    final data = {
      "header": header,
      'metadata': metadata,
      "playlists": playlists,
      'continuationToken': continuationToken
    };

    return _channelResponseMapper.toModel(data);
  }
}
