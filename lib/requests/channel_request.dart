import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/mappers/channel_response_mapper.dart';
import 'package:innertube_dart/mappers/channerl_renderer_mapper.dart';
import 'package:innertube_dart/mappers/playlist_renderer_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/requests/playlist_request.dart';
import 'package:innertube_dart/requests/video_request.dart';
import 'package:innertube_dart/utils/utils.dart';

class ChannelRequest extends InnertubeBase {
  final Locale? locale;

  ChannelRequest({this.locale = const Locale('en', 'US')});

  final ChannelResponseMapper _channelResponseMapper = ChannelResponseMapper();
  final ChannelRendererMapper _channelRendererMapper = ChannelRendererMapper();
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
        return _getChannelHome(response, continuationToken);
      case ChannelSection.videos:
        return _getChannelVideos(response, continuationToken);
      case ChannelSection.playlists:
        return _getChannelPlaylists(response, continuationToken);
      default:
        return _getChannelHome(response, continuationToken);
    }
  }

  Future<Channel> _getChannelHome(
      Map<String, dynamic> response, String? continuationToken) async {
    String? continuationTokenNew;
    List<dynamic> sectionList;

    Map<String, dynamic>? header;
    Map<String, dynamic>? metadata;
    if (continuationToken == null) {
      header = response['header']['c4TabbedHeaderRenderer'];
      metadata = response['metadata']['channelMetadataRenderer'];
      sectionList = response['contents']['twoColumnBrowseResultsRenderer']
              ['tabs'][0]['tabRenderer']['content']['sectionListRenderer']
          ['contents'];
    } else {
      //TODO: To be tested because never happens before.
      sectionList = response['onResponseReceivedActions'][0]
          ['appendContinuationItemsAction']['continuationItems'];
    }

    // Filter the contents to get only the sections with shelfRenderer.
    final sections = Utils.filterChannelContents(sectionList);

    // Iterate over each section and get the videos and playlists.
    final List<dynamic> newSections = [];
    for (final section in sections) {
      final newSection = await _processSection(section);
      continuationTokenNew = await _getContinuationToken(section);
      newSections.add(newSection);
    }

    final data = {
      if (continuationToken == null) "header": header,
      if (continuationToken == null) 'metadata': metadata,
      "sections": newSections,
      'continuationToken': continuationTokenNew
    };

    return _channelResponseMapper.toModel(data);
  }

  Future<Channel> _getChannelVideos(
      Map<String, dynamic> response, String? continuationToken) async {
    String? newContinuationToken;

    Map<String, dynamic>? header;
    Map<String, dynamic>? metadata;
    List<dynamic> items;
    if (continuationToken == null) {
      header = response['header']['c4TabbedHeaderRenderer'];
      metadata = response['metadata']['channelMetadataRenderer'];
      items = response['contents']['twoColumnBrowseResultsRenderer']['tabs'][1]
          ['tabRenderer']['content']['richGridRenderer']['contents'];
    } else {
      items = response['onResponseReceivedActions'][0]
          ['appendContinuationItemsAction']['continuationItems'];
    }

    final List<Video> videos = await _processItems(items);
    for (final item in items) {
      /* if (item['continuationItemRenderer'] != null) {
        newContinuationToken = item['continuationItemRenderer']
            ['continuationEndpoint']['continuationCommand']['token'];
      } */
      newContinuationToken = await _getContinuationToken(item);
    }

    final data = {
      if (continuationToken == null) "header": header,
      if (continuationToken == null) 'metadata': metadata,
      "videos": videos,
      'continuationToken': newContinuationToken
    };

    return _channelResponseMapper.toModel(data);
  }

  Future<Channel> _getChannelPlaylists(
      Map<String, dynamic> response, String? continuationToken) async {
    String? newContinuationToken;

    Map<String, dynamic>? header;
    Map<String, dynamic>? metadata;
    List<dynamic> items = [];
    if (continuationToken == null) {
      final tabs =
          response['contents']['twoColumnBrowseResultsRenderer']['tabs'];
      for (final tab in tabs) {
        if (tab['tabRenderer'] != null) {
          if (tab['tabRenderer']['title'] == 'Playlist') {
            items = tab['tabRenderer']['content']['sectionListRenderer']
                    ['contents'][0]['itemSectionRenderer']['contents'][0]
                ['gridRenderer']['items'];
          }
        }
      }

      header = response['header']['c4TabbedHeaderRenderer'];
      metadata = response['metadata']['channelMetadataRenderer'];
    } else {
      //TODO: To be tested because never happens before.
      items = response['onResponseReceivedActions'][0]
          ['appendContinuationItemsAction']['continuationItems'];
    }

    final List<Playlist> playlists = _processPlaylistItems(items);
    for (final item in items) {
      newContinuationToken = await _getContinuationToken(item);
    }

    final data = {
      if (continuationToken == null) "header": header,
      if (continuationToken == null) 'metadata': metadata,
      "playlists": playlists,
      'continuationToken': newContinuationToken
    };

    return _channelResponseMapper.toModel(data);
  }

  Future<List<Video>> _processItems(List<dynamic> items) async {
    final futures = <Future<Video>>[];
    for (final item in items) {
      if (item['richItemRenderer'] != null) {
        final videoId =
            item['richItemRenderer']['content']['videoRenderer']['videoId'];
        futures.add(VideoRequest(locale: locale)
            .getVideo(videoId: videoId, withStreamingUrl: false));
      }
    }
    return await Future.wait(futures);
  }

  List<Playlist> _processPlaylistItems(List<dynamic> items) {
    final playlists = <Playlist>[];
    for (final item in items) {
      if (item['gridPlaylistRenderer'] != null) {
        final playlist = _playlistRendererMapper.toModel(item);
        playlists.add(playlist);
      }
    }
    return playlists;
  }

  Future<Map<String, dynamic>> _processSection(
      Map<String, dynamic> section) async {
    final newSection = {
      'title': section['title'],
      'playlistId': section['playlistId'],
      'videos': [],
      'playlists': [],
      'featuredChannels': []
    };
    final futures = <Future>[];
    for (final content in section['contents']) {
      if (content['gridVideoRenderer'] != null) {
        final videoId = content['gridVideoRenderer']['videoId'];
        futures.add(_processVideo(newSection, videoId));
      }

      if (content['gridPlaylistRenderer'] != null) {
        final playlistId =
            Utils.setPlaylistId(content['gridPlaylistRenderer']['playlistId']);
        futures.add(_processPlaylist(newSection, playlistId!));
      }

      if (content['channelRenderer'] != null) {
        final featuredChannel =
            _channelRendererMapper.toModel(content['channelRenderer']);
        (newSection['featuredChannels'] as List<dynamic>).add(featuredChannel);
      }

      if (content['gridChannelRenderer'] != null) {
        final featuredChannel =
            _channelRendererMapper.toModel(content['gridChannelRenderer']);
        (newSection['featuredChannels'] as List<dynamic>).add(featuredChannel);
      }
    }
    await Future.wait(futures);
    return newSection;
  }

  Future _getContinuationToken(Map<String, dynamic> data) async {
    String? continuationToken;
    // case 1: the continuation token is in the sections
    if (data['contents'] != null) {
      for (final content in data['contents']) {
        if (content['continuationItemRenderer'] != null) {
          continuationToken = content['continuationItemRenderer']
              ['continuationEndpoint']['continuationCommand']['token'];
        }
      }
    }

    // case 2: the continuation token is in the item
    if (data['continuationItemRenderer'] != null) {
      continuationToken = data['continuationItemRenderer']
          ['continuationEndpoint']['continuationCommand']['token'];
    }
    return continuationToken;
  }

  Future _processVideo(Map<String, dynamic> newSection, String videoId) async {
    final video = await VideoRequest(locale: locale)
        .getVideo(videoId: videoId, withStreamingUrl: false);
    (newSection['videos'] as List<dynamic>).add(video);
  }

  Future _processPlaylist(
      Map<String, dynamic> newSection, String playlistId) async {
    final playlist = await PlaylistRequest(locale: locale)
        .getPlaylist(playlistId: playlistId, getVideos: false);
    (newSection['playlists'] as List<dynamic>).add(playlist);
  }
}
