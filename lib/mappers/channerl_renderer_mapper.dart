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
      thumbnails: (data['thumbnail']['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      videoCount: data['videoCountText']['simpleText'],
      subscriberCount: data['subscriberCountText']['simpleText'],
    );
  }
}
