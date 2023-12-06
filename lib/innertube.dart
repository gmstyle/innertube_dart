import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/video_mapper.dart';
import 'package:innertube_dart/models/responses/video/video.dart';

class Innertube extends InnertubeAdaptor {
  Innertube();
  final VideoMapper _videoMapper = VideoMapper();

  /// Retrieves a video with the given [videoId].
  ///
  /// The [videoId] is used to identify the video to be fetched.
  /// This method returns a [Future] that resolves to a [Video] object.
  /// If the video is found a [Video] object is returned.
  /// If the video is not found, an exception is thrown.
  Future<Video> getVideo(String videoId) async {
    final endpoint = Endpoint.player.name;
    final params = {
      'videoId': videoId,
    };
    final response = await dispatch(endpoint, params: params);

    return _videoMapper.toModel(response);
  }

  Future<Map> search(String query, {String? continuationToken}) async {
    final endpoint = Endpoint.search.name;
    final params = {
      'query': query,
      'continuation': continuationToken,
    };
    final response = await dispatch(endpoint, params: params);

    return response;
  }
}
