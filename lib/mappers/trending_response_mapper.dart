import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/mappers/video_renderer_mapper.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';

class TrendingResponseMapper
    extends BaseMapper<TrendingResponse, Map<String, dynamic>> {
  final VideorendererMapper _videoRendererMapper = VideorendererMapper();
  @override
  Map<String, dynamic> toData(TrendingResponse model) {
    throw UnimplementedError();
  }

  @override
  TrendingResponse toModel(Map<String, dynamic> data) {
    final nowVideos = <Video>[];
    final List<dynamic> nowItems = data['contents']
                    ['twoColumnBrowseResultsRenderer']['tabs'][0]['tabRenderer']
                ['content']['sectionListRenderer']['contents'][0]
            ['itemSectionRenderer']['contents'][0]['shelfRenderer']['content']
        ['expandedShelfContentsRenderer']['items'];

    for (final item in nowItems) {
      if (item.containsKey('videoRenderer')) {
        nowVideos.add(_videoRendererMapper
            .toModel(item['videoRenderer'] as Map<String, dynamic>));
      }
    }

    return TrendingResponse(
      videos: nowVideos,
    );
  }
}
