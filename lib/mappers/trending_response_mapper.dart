import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/mappers/video_renderer_mapper.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';

class TrendingResponseMapper
    extends BaseMapper<TrendingResponse, Map<String, dynamic>> {
  final VideoRendererMapper _videoRendererMapper = VideoRendererMapper();
  @override
  Map<String, dynamic> toData(TrendingResponse model) {
    throw UnimplementedError();
  }

  @override
  TrendingResponse toModel(Map<String, dynamic> data) {
    final videos = <Video>[];
    final List<dynamic> items = data['tabRenderer']['content']
                ['sectionListRenderer']['contents'][0]['itemSectionRenderer']
            ['contents'][0]['shelfRenderer']['content']
        ['expandedShelfContentsRenderer']['items'];

    for (Map<String, dynamic> item in items) {
      if (item.containsKey('videoRenderer')) {
        videos.add(_videoRendererMapper
            .toModel(item['videoRenderer'] as Map<String, dynamic>));
      }
    }

    return TrendingResponse(
      videos: videos,
    );
  }
}
