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
      channelId: data['header']['channelId'],
      title: data['header']['title'],
      description: data['metadata']['description'],
      videoCount: data['header']['videosCountText']['runs'][0]['text'],
      subscriberCount: data['subscriberCount'],
      channelHandleText: data['header']['channelHandleText']['runs'][0]['text'],
      avatars: [
        ...data['header']['avatar']['thumbnails'],
        ...data['metadata']['avatar']['thumbnails']
      ],
      banners: data['header']['banner']['thumbnails'],
      tvBanners: data['header']['tvBanner']['thumbnails'],
      sections: data['sections'] ?? [],
      videos: data['videos'] ?? [],
      playlists: data['playlists'] ?? [],
      continuationToken: data['continuationToken'] ?? '',
    );
  }
}
