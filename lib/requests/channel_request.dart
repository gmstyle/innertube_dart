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

    if (continuationToken == null) {
      final header = response['header']['c4TabbedHeaderRenderer'];
      final metadata = response['metadata']['channelMetadataRenderer'];
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
          'playlists': [],
          'featuredChannels': []
        };
        for (final content in section['contents']) {
          if (content['gridVideoRenderer'] != null) {
            final videoId = content['gridVideoRenderer']['videoId'];
            final video = await VideoRequest(locale: locale)
                .getVideo(videoId: videoId, withStreamingUrl: false);
            (newSection['videos'] as List<dynamic>).add(video);
          }

          if (content['gridPlaylistRenderer'] != null) {
            final playlistId = Utils.setPlaylistId(
                content['gridPlaylistRenderer']['playlistId']);
            final playlist = await PlaylistRequest(locale: locale)
                .getPlaylist(playlistId: playlistId!, getVideos: false);
            (newSection['playlists'] as List<dynamic>).add(playlist);
          }

          if (content['channelRenderer'] != null) {
            final featuredChannel =
                _channelRendererMapper.toModel(content['channelRenderer']);
            (newSection['featuredChannels'] as List<dynamic>)
                .add(featuredChannel);
          }

          if (content['gridChannelRenderer'] != null) {
            final featuredChannel =
                _channelRendererMapper.toModel(content['gridChannelRenderer']);
            (newSection['featuredChannels'] as List<dynamic>)
                .add(featuredChannel);
          }

          if (content['continuationItemRenderer'] != null) {
            continuationTokenNew = content['continuationItemRenderer']
                ['continuationEndpoint']['continuationCommand']['token'];
          }
        }
        newSections.add(newSection);
      }

      final data = {
        "header": header,
        'metadata': metadata,
        "sections": newSections,
        'continuationToken': continuationTokenNew
      };

      return _channelResponseMapper.toModel(data);
    } else {
      //TODO: To be tested because never happens before.

      final List<dynamic> items = response['onResponseReceivedActions'][0]
          ['appendContinuationItemsAction']['continuationItems'];

      // Filter the contents to get only the sections with shelfRenderer.
      final sections = Utils.filterChannelContents(items);

      // Iterate over each section and get the videos and playlists.
      final List<dynamic> newSections = [];
      for (final section in sections) {
        final newSection = {
          'title': section['title'],
          'playlistId': section['playlistId'],
          'videos': [],
          'playlists': [],
          'featuredChannels': []
        };
        for (final content in section['contents']) {
          if (content['gridVideoRenderer'] != null) {
            final videoId = content['gridVideoRenderer']['videoId'];
            final video = await VideoRequest(locale: locale)
                .getVideo(videoId: videoId, withStreamingUrl: false);
            (newSection['videos'] as List<dynamic>).add(video);
          }

          if (content['gridPlaylistRenderer'] != null) {
            final playlistId = Utils.setPlaylistId(
                content['gridPlaylistRenderer']['playlistId']);
            final playlist = await PlaylistRequest(locale: locale)
                .getPlaylist(playlistId: playlistId!, getVideos: false);
            (newSection['playlists'] as List<dynamic>).add(playlist);
          }

          if (content['channelRenderer'] != null) {
            final featuredChannel =
                _channelRendererMapper.toModel(content['channelRenderer']);
            (newSection['featuredChannels'] as List<dynamic>)
                .add(featuredChannel);
          }

          if (content['gridChannelRenderer'] != null) {
            final featuredChannel =
                _channelRendererMapper.toModel(content['gridChannelRenderer']);
            (newSection['featuredChannels'] as List<dynamic>)
                .add(featuredChannel);
          }

          if (content['continuationItemRenderer'] != null) {
            continuationTokenNew = content['continuationItemRenderer']
                ['continuationEndpoint']['continuationCommand']['token'];
          }
        }
        newSections.add(newSection);
      }

      final data = {
        "sections": newSections,
        'continuationToken': continuationTokenNew
      };

      return _channelResponseMapper.toModel(data);
    }
  }

  Future<Channel> _getChannelVideos(
      Map<String, dynamic> response, String? continuationToken) async {
    String? newContinuationToken;

    if (continuationToken == null) {
      final header = response['header']['c4TabbedHeaderRenderer'];
      final metadata = response['metadata']['channelMetadataRenderer'];
      final List<dynamic> items = response['contents']
              ['twoColumnBrowseResultsRenderer']['tabs'][1]['tabRenderer']
          ['content']['richGridRenderer']['contents'];

      final List<Video> videos = [];
      for (final item in items) {
        if (item['richItemRenderer'] != null) {
          final videoId =
              item['richItemRenderer']['content']['videoRenderer']['videoId'];
          final video = await VideoRequest(locale: locale)
              .getVideo(videoId: videoId, withStreamingUrl: false);
          videos.add(video);
        }

        if (item['continuationItemRenderer'] != null) {
          newContinuationToken = item['continuationItemRenderer']
              ['continuationEndpoint']['continuationCommand']['token'];
        }
      }

      final data = {
        "header": header,
        'metadata': metadata,
        "videos": videos,
        'continuationToken': newContinuationToken
      };

      return _channelResponseMapper.toModel(data);
    } else {
      final List<dynamic> items = response['onResponseReceivedActions'][0]
          ['appendContinuationItemsAction']['continuationItems'];
      final List<Video> videos = [];
      for (final item in items) {
        if (item['richItemRenderer'] != null) {
          final videoId =
              item['richItemRenderer']['content']['videoRenderer']['videoId'];
          final video = await VideoRequest(locale: locale)
              .getVideo(videoId: videoId, withStreamingUrl: false);
          videos.add(video);
        }

        if (item['continuationItemRenderer'] != null) {
          newContinuationToken = item['continuationItemRenderer']
              ['continuationEndpoint']['continuationCommand']['token'];
        }
      }

      final data = {
        "videos": videos,
        'continuationToken': newContinuationToken
      };

      return _channelResponseMapper.toModel(data);
    }
  }

  Future<Channel> _getChannelPlaylists(
      Map<String, dynamic> response, String? continuationToken) async {
    String? newContinuationToken;

    if (continuationToken == null) {
      final header = response['header']['c4TabbedHeaderRenderer'];
      final metadata = response['metadata']['channelMetadataRenderer'];
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
          newContinuationToken = item['continuationItemRenderer']
              ['continuationEndpoint']['continuationCommand']['token'];
        }
      }

      final data = {
        "header": header,
        'metadata': metadata,
        "playlists": playlists,
        'continuationToken': newContinuationToken
      };

      return _channelResponseMapper.toModel(data);
    } else {
      //TODO: To be tested because never happens before.
      final List<dynamic> items = response['onResponseReceivedActions'][0]
          ['appendContinuationItemsAction']['continuationItems'];
      final List<Playlist> playlists = [];
      for (final item in items) {
        if (item['gridPlaylistRenderer'] != null) {
          final playlist = _playlistRendererMapper.toModel(item);
          playlists.add(playlist);
        }

        if (item['continuationItemRenderer'] != null) {
          newContinuationToken = item['continuationItemRenderer']
              ['continuationEndpoint']['continuationCommand']['token'];
        }
      }

      final data = {
        "playlists": playlists,
        'continuationToken': newContinuationToken
      };

      return _channelResponseMapper.toModel(data);
    }
  }
}
