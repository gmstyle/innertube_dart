import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';

class ChannelRendererMapper extends BaseMapper<Channel, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Channel model) {
    throw UnimplementedError();
  }

  @override
  Channel toModel(Map<String, dynamic> data) {
    return Channel(
      channelId: data['channelId'],
      title: data['title']['simpleText'],
      thumbnails:
          _fixThumbnails(data['thumbnail']['thumbnails'] as List<dynamic>),
      videoCount: data['videoCountText']['simpleText'],
      subscriberCount: data['subscriberCountText']['simpleText'],
    );
  }

  String? _fixThumbnailUrl(String? url) {
    if (url == null) return null;
    String? fixedUrl = url;

    if (url.startsWith('//')) {
      fixedUrl = 'https:$url';
    }

    return fixedUrl;
  }

  List<Map<String, dynamic>> _fixThumbnails(List<dynamic>? thumbnails) {
    if (thumbnails == null) return [];
    return thumbnails
        .map((e) => {
              'url': _fixThumbnailUrl(e['url'] as String),
              'width': e['width'],
              'height': e['height'],
            })
        .toList();
  }
}
