import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/video.dart';

class VideoRendererMapper extends BaseMapper<Video, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Video model) {
    throw UnimplementedError();
  }

  @override
  Video toModel(Map<String, dynamic> data) {
    return Video(
      videoId: data['videoId'],
      author: data['ownerText']['runs'][0]['text'],
      title: data['title']['runs'][0]['text'],
      lengthSeconds: data['lengthText']['simpleText'],
      channelId: data['channelThumbnailSupportedRenderers']
              ['channelThumbnailWithLinkRenderer']['navigationEndpoint']
          ['browseEndpoint']['browseId'],
      thumbnails: (data['thumbnail']['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      viewCount: data['viewCountText']['simpleText'],
    );
  }
}
