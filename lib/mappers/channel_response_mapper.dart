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
    return Channel(
      channelId: data['header'] != null ? data['header']['channelId'] : null,
      title: data['header'] != null ? data['header']['title'] : null,
      description:
          data['metadata'] != null ? data['metadata']['description'] : null,
      videoCount: data['header']['videosCountText'] != null
          ? data['header']['videosCountText']['runs'][0]['text']
          : null,
      subscriberCount: data['header'] != null &&
              data['header']['subscriberCountText'] != null
          ? data['header']['subscriberCountText']['simpleText']
          : null,
      channelHandleText: data['header'] != null
          ? data['header']['channelHandleText']['runs'][0]['text']
          : null,
      avatars: [
        ...data['header'] != null && data['header']['avatar'] != null
            ? (data['header']['avatar']['thumbnails'] as List<dynamic>)
                .map((e) => Thumbnail(
                      url: e['url'],
                      width: e['width'],
                      height: e['height'],
                    ))
                .toList()
            : [],
        ...data['metadata'] != null && data['metadata']['avatar'] != null
            ? (data['metadata']['avatar']['thumbnails'] as List<dynamic>)
                .map((e) => Thumbnail(
                      url: e['url'],
                      width: e['width'],
                      height: e['height'],
                    ))
                .toList()
            : [],
      ],
      banners: data['header'] != null && data['header']['banner'] != null
          ? (data['header']['banner']['thumbnails'] as List<dynamic>)
              .map((e) => Thumbnail(
                    url: e['url'],
                    width: e['width'],
                    height: e['height'],
                  ))
              .toList()
          : null,
      tvBanners: data['header'] != null && data['header']['tvBanner'] != null
          ? (data['header']['tvBanner']['thumbnails'] as List<dynamic>)
              .map((e) => Thumbnail(
                    url: e['url'],
                    width: e['width'],
                    height: e['height'],
                  ))
              .toList()
          : null,
      sections: (data['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e))
          .toList(),
      videos: data['videos'],
      playlists: data['playlists'],
      continuationToken: data['continuationToken'],
    );
  }
}
