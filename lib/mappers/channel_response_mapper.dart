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
      channelId: data['channelId'],
      title: data['title'],
      videoCount: data['videoCount'],
      subscriberCount: data['subscriberCount'],
    );
  }
}
