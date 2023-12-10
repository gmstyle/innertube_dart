import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/channel_response_mapper.dart';
import 'package:innertube_dart/mappers/music_home_response_mapper.dart';
import 'package:innertube_dart/mappers/playlist_renderer_mapper.dart';
import 'package:innertube_dart/mappers/playlist_response_mapper.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/mappers/trending_response_mapper.dart';
import 'package:innertube_dart/mappers/video_response_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';
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
  final PlaylistRendererMapper _playlistRendererMapper =
      PlaylistRendererMapper();
  final MusicHomeResponseMapper _musicHomeResponseMapper =
      MusicHomeResponseMapper();

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

  /// Retrieves a [Channel] based on the provided parameters.
  ///
  /// The [channelId] parameter is required and specifies the ID of the channel to retrieve.
  /// The [channelSection] parameter is optional and specifies the section of the channel to retrieve.
  /// If not provided, it defaults to [ChannelSection.home].
  /// The [continuationToken] parameter is optional and specifies a token for pagination.
  ///
  /// Returns a [Future] that resolves to a [Channel] object.
  /// Throws an exception if an error occurs during the retrieval process.
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

  Future<MusicHomeResponse> getMusicHome() async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': ExploreSection.music.browseId,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    final carouselItems = response['contents']['twoColumnBrowseResultsRenderer']
            ['tabs'][0]['tabRenderer']['content']['sectionListRenderer']
        ['contents'];
    final carouselThumbnails = response['header']['carouselHeaderRenderer']
        ['contents'][0]['carouselItemRenderer']['paginationThumbnails'];

    return _musicHomeResponseMapper.toModel(response);
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
        final video = await getVideo(videoId: videoId);
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
