import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';
import 'package:innertube_dart/models/responses/playlist.dart';

import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/requests/channel_request.dart';
import 'package:innertube_dart/requests/music_home_request.dart';
import 'package:innertube_dart/requests/playlist_request.dart';
import 'package:innertube_dart/requests/search_request.dart';
import 'package:innertube_dart/requests/suggest_queries_request.dart';
import 'package:innertube_dart/requests/trending_request.dart';
import 'package:innertube_dart/requests/video_request.dart';

class Innertube extends InnertubeAdaptor {
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
    final response =
        await VideoRequest(locale: locale).getVideo(videoId: videoId);

    return response;
  }

  /// Performs a search using the specified [query] and optional [continuationToken].
  ///
  /// Returns a [Future] that completes with a [SearchResponse] object.
  /// The [query] parameter is the search query string.
  /// The [continuationToken] parameter is an optional token used for pagination.
  /// The [SearchResponse] object contains the search results.
  Future<SearchResponse> search(
      {required String query, String? continuationToken}) async {
    final response = SearchRequest(locale: locale)
        .search(query: query, continuationToken: continuationToken);

    return response;
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
    final response = TrendingRequest(locale: locale)
        .getTrending(trendingCategory: trendingCategory);

    return response;
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
    final response = await PlaylistRequest(locale: locale).getPlaylist(
        playlistId: playlistId,
        continuationToken: continuationToken,
        getVideos: getVideos);

    return response;
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
    final response = await ChannelRequest(locale: locale).getChannel(
        channelId: channelId,
        channelSection: channelSection,
        continuationToken: continuationToken);

    return response;
  }

  /// Retrieves the music home data.
  ///
  /// Returns a [Future] that resolves to a [MusicHomeResponse] object.
  Future<MusicHomeResponse> getMusicHome() async {
    final response = await MusicHomeRequest(locale: locale).getMusicHome();

    return response;
  }

  /// Suggests a list of queries based on the provided query.
  ///
  /// Returns a Future that completes with a List of Strings representing the suggested queries.
  /// The [query] parameter is required and specifies the input query.
  /// The returned list may be null if no suggestions are available.
  Future<List<String>?> suggestQueries({required String query}) async {
    final queries =
        await SuggestQueriesRequests(locale: locale).suggestQuesries(query);
    return queries;
  }
}
