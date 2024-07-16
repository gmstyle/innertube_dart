import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/section.dart';
import 'package:innertube_dart/models/responses/thumbnail.dart';

class ChannelResponseMapper extends BaseMapper<Channel, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Channel model) {
    // TODO: implement toData
    throw UnimplementedError();
  }

  @override
  Channel toModel(Map<String, dynamic> data) {
    final header = data['header'];
    final metadata = data['metadata'];

    return Channel(
      channelId: metadata?['externalId'],
      title: metadata?['title'],
      description: metadata?['description'],
      videoCount: header?['videosCountText']?['runs']?[0]['text'],
      subscriberCount: header?['subscriberCountText']?['simpleText'],
      channelHandleText: header?['channelHandleText']?['runs']?[0]['text'],
      avatars:
          _getThumbnails(header, 'avatar') + _getThumbnails(metadata, 'avatar'),
      banners: _getThumbnails(header, 'banner'),
      tvBanners: _getThumbnails(header, 'tvBanner'),
      sections: (data['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e))
          .toList(),
      videos: data['videos'],
      playlists: data['playlists'],
      continuationToken: data['continuationToken'],
    );
  }

  List<Thumbnail> _getThumbnails(Map<String, dynamic>? data, String key) {
    return data != null && data[key] != null
        ? (data[key]['thumbnails'] as List<dynamic>)
            .map((e) => Thumbnail(
                  url: e['url'],
                  width: e['width'],
                  height: e['height'],
                ))
            .toList()
        : [];
  }
}
