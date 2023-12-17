import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';

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
      videoCount: data['header'] != null
          ? data['header']['videosCountText']['runs'][0]['text']
          : null,
      subscriberCount: data['subscriberCount'],
      channelHandleText: data['header'] != null
          ? data['header']['channelHandleText']['runs'][0]['text']
          : null,
      avatars: [
        ...data['header'] != null ? data['header']['avatar']['thumbnails'] : [],
        ...data['metadata'] != null
            ? data['metadata']['avatar']['thumbnails']
            : [],
      ],
      banners: data['header'] != null
          ? data['header']['banner']['thumbnails']
          : null,
      tvBanners: data['header'] != null
          ? data['header']['tvBanner']['thumbnails']
          : null,
      sections: data['sections'],
      videos: data['videos'],
      playlists: data['playlists'],
      continuationToken: data['continuationToken'],
    );
  }
}
