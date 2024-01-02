import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/thumbnail.dart';

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
      thumbnails: _fixThumbnails(data['thumbnail']['thumbnails']),
      videoCount: data['videoCountText'] != null
          ? data['videoCountText']['simpleText']
          : null,
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

  List<Thumbnail> _fixThumbnails(List<dynamic>? thumbnails) {
    if (thumbnails == null) return [];
    return thumbnails
        .map((e) => Thumbnail(
              url: _fixThumbnailUrl(e['url']),
              width: e['width'],
              height: e['height'],
            ))
        .toList();
  }
}
