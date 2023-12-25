import 'package:flutter/widgets.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/mappers/video_response_mapper.dart';
import 'package:innertube_dart/models/responses/video.dart' as innertube_video;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoRequest extends InnertubeBase {
  final Locale? locale;
  final yt = YoutubeExplode();

  VideoRequest({this.locale = const Locale('en', 'US')});

  final VideoResponseMapper _videoResponseMapper = VideoResponseMapper();

  Future<innertube_video.Video> getVideo({
    required String videoId,
    bool withStreamingUrl = true,
  }) async {
    final endpoint = Endpoint.player.name;
    final params = {
      'videoId': videoId,
    };
    final response = await dispatch(endpoint, params: params, locale: locale);

    String? muxedStreamingUrl;
    if (withStreamingUrl) {
      final streamingManifest =
          await yt.videos.streamsClient.getManifest(videoId);
      muxedStreamingUrl = streamingManifest.muxed.bestQuality.url.toString();
    }

    final map = {
      'response': response,
      'muxedStreamingUrl': muxedStreamingUrl,
    };

    return _videoResponseMapper.toModel(map);
  }
}
