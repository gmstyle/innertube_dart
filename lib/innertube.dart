import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/mappers/trending_response_mapper.dart';
import 'package:innertube_dart/mappers/video_mapper_response.dart';

import 'package:innertube_dart/models/responses/home_response.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/utils/utils.dart';

class Innertube extends InnertubeAdaptor {
  final VideoMapper _videoMapper = VideoMapper();
  final SearchResponseMapper _searchResponseMapper = SearchResponseMapper();
  final TrendingResponseMapper _trendingResponseMapper =
      TrendingResponseMapper();

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

    return _videoMapper.toModel(response);
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

  /// Retrieves the trending videos based on the specified [trendingCategory] and [continuationToken].
  ///
  /// The [trendingCategory] parameter specifies the category of trending videos to retrieve. If not provided, the default value is [TrendingCategory.now].
  /// The [continuationToken] parameter is used for pagination, allowing you to retrieve the next set of trending videos.
  ///
  /// Returns a [Future] that resolves to a [TrendingResponse] object containing the trending videos.
  Future<TrendingResponse> getTrending(
      {TrendingCategory? trendingCategory = TrendingCategory.now,
      String? continuationToken}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': BrowseId.FEtrending.name,
      'params': trendingCategory?.param,
      'continuation': continuationToken,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    return _trendingResponseMapper.toModel(response);
  }
}
