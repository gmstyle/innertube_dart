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
    final List<dynamic> itemSectionRenderers =
        data['tabRenderer']['content']['sectionListRenderer']['contents'];

    for (var map in itemSectionRenderers) {
      final expandedShelfContentsRenderer = map['itemSectionRenderer']
              ['contents'][0]['shelfRenderer']['content']
          ['expandedShelfContentsRenderer'];
      if (expandedShelfContentsRenderer != null) {
        for (var item in expandedShelfContentsRenderer['items']) {
          final videoRenderer = item['videoRenderer'];
          if (videoRenderer != null) {
            videos.add(_videoRendererMapper
                .toModel(videoRenderer as Map<String, dynamic>));
          }
        }
      }
    }

    return TrendingResponse(
      videos: videos,
    );
  }
}
