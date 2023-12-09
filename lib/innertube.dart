import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/channel_response_mapper.dart';
import 'package:innertube_dart/mappers/playlist_response_mapper.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/mappers/trending_response_mapper.dart';
import 'package:innertube_dart/mappers/video_response_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/playlist.dart';

import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/utils/utils.dart';

class Innertube extends InnertubeAdaptor {
  final VideoResponseMapper _videoResponseMapper = VideoResponseMapper();
  final SearchResponseMapper _searchResponseMapper = SearchResponseMapper();
  final TrendingResponseMapper _trendingResponseMapper =
      TrendingResponseMapper();
  final PlaylistResponseMapper _playlistResponseMapper =
      PlaylistResponseMapper();
  final ChannelResponseMapper _channelResponseMapper = ChannelResponseMapper();

  final Locale? locale;

  Innertube({this.locale = const Locale('en', 'US')});

  /// Retrieves a video with the given [videoId].
  ///
  /// The [videoId] is used to identify the video to be fetched.
  /// This method returns a [Future] that resolves to a [Video] object.
  /// If the video is found a [Video] object is returned.
  /// If the video is not found, an exception is thrown.
  Future<Video> getVideo({
    required String videoId,
  }) async {
    final endpoint = Endpoint.player.name;
    final params = {
      'videoId': videoId,
    };
    final response = await dispatch(endpoint, params: params, locale: locale);

    return _videoResponseMapper.toModel(response);
  }

  /// Performs a search using the specified [query] and optional [continuationToken].
  ///
  /// Returns a [Future] that completes with a [SearchResponse] object.
  /// The [query] parameter is the search query string.
  /// The [continuationToken] parameter is an optional token used for pagination.
  /// The [SearchResponse] object contains the search results.
  Future<SearchResponse> search(
      {required String query, String? continuationToken}) async {
    final endpoint = Endpoint.search.name;
    final params = {
      'query': query,
      'continuation': continuationToken,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    return _searchResponseMapper.toModel(response);
  }

  /* Future<HomeResponse> getHomeContent(
      {BrowseId? browseId = BrowseId.FEwhat_to_watch,
      TrendingCategory? trendingCategory = TrendingCategory.music,
      String? continuationToken}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': browseId!.name,
      'continuation': continuationToken,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    return HomeResponse();
  } */

  /// Retrieves the trending videos based on the specified [trendingCategory].
  ///
  /// The [trendingCategory] parameter is optional and defaults to [TrendingCategory.now].
  /// It represents the category of trending videos to retrieve.
  ///
  /// Returns a [Future] that resolves to a [TrendingResponse] object containing the trending videos.
  /// The [TrendingResponse] object is mapped from the API response.
  Future<TrendingResponse> getTrending(
      {TrendingCategory? trendingCategory = TrendingCategory.now}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': BrowseId.FEtrending.name,
      'params': trendingCategory?.param
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    late int index;
    switch (trendingCategory) {
      case TrendingCategory.now:
        index = 0;
        break;
      case TrendingCategory.music:
        index = 1;
        break;
      case TrendingCategory.gaming:
        index = 2;
        break;
      case TrendingCategory.film:
        index = 3;
        break;
      default:
        index = 0;
    }

    return _trendingResponseMapper.toModel(
        response['contents']['twoColumnBrowseResultsRenderer']['tabs'][index]);
  }

  /// Retrieves a playlist with the specified [playlistId].
  ///
  /// The [continuationToken] parameter is optional and can be used to fetch the next page of results.
  /// The [getVideos] parameter determines whether to fetch the videos associated with the playlist.
  ///
  /// Returns a [Future] that resolves to a [Playlist] object.
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
    final videoIds = playlistVideoListRenderer
        .map((e) => e['playlistVideoRenderer']['videoId'])
        .toList();
    final List<Video> videos = [];
    if (getVideos) {
      for (final videoId in videoIds) {
        final video = await getVideo(videoId: videoId);
        videos.add(video);
      }
    }

    final data = {
      "playlistData": response['header']['playlistHeaderRenderer'],
      "videos": videos
    };

    return _playlistResponseMapper.toModel(data);
  }

  Future<Channel> getChannel(
      {required String channelId, String? continuationToken}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': channelId,
      'continuation': continuationToken,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    final List<dynamic> sectionList = response['contents']
            ['twoColumnBrowseResultsRenderer']['tabs'][0]['tabRenderer']
        ['content']['sectionListRenderer']['contents'];

    final header = response['header']['c4TabbedHeaderRenderer'];

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
          final video = await getVideo(videoId: videoId);
          newSection['videos'].add(video);
        }

        if (content['gridPlaylistRenderer'] != null) {
          final playlistId = Utils.setPlaylistId(
              content['gridPlaylistRenderer']['playlistId']);
          final playlist =
              await getPlaylist(playlistId: playlistId!, getVideos: false);
          newSection['playlists'].add(playlist);
        }
      }
      newSections.add(newSection);
    }

    final data = {"header": header, "sections": newSections};

    return _channelResponseMapper.toModel(data);
  }
}
