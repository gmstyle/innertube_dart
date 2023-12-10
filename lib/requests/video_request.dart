import 'package:flutter/widgets.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/video_response_mapper.dart';
import 'package:innertube_dart/models/responses/video.dart';

class VideoRequest extends InnertubeAdaptor {
  final Locale? locale;

  VideoRequest({this.locale = const Locale('en', 'US')});

  final VideoResponseMapper _videoResponseMapper = VideoResponseMapper();

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
}
