import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/mappers/video_mapper.dart';
import 'package:innertube_dart/models/responses/home_response.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/video.dart';

class Innertube extends InnertubeAdaptor {
  Innertube();
  final VideoMapper _videoMapper = VideoMapper();
  final SearchResponseMapper _searchResponseMapper = SearchResponseMapper();

  /// Retrieves a video with the given [videoId].
  ///
  /// The [videoId] is used to identify the video to be fetched.
  /// This method returns a [Future] that resolves to a [Video] object.
  /// If the video is found a [Video] object is returned.
  /// If the video is not found, an exception is thrown.
  Future<Video> getVideo({required String videoId}) async {
    final endpoint = Endpoint.player.name;
    final params = {
      'videoId': videoId,
    };
    final response = await dispatch(endpoint, params: params);

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
    Map<String, String> params = {
      'query': query,
    };
    if (continuationToken != null) {
      params['continuation'] = continuationToken;
    }
    final response = await dispatch(endpoint, params: params);

    return _searchResponseMapper.toModel(response);
  }

  Future<HomeResponse> getHomeContent(
      {BrowseId? browseId = BrowseId.FEwhat_to_watch,
      TrendingCategory? trendingCategory = TrendingCategory.music,
      String? continuationToken}) async {
    final endpoint = Endpoint.browse.name;
    Map<String, String> params = {
      'browseId': browseId!.name,
    };
    if (continuationToken != null) {
      params['continuation'] = continuationToken;
    }
    final response = await dispatch(endpoint, params: params);

    return HomeResponse();
  }
}
