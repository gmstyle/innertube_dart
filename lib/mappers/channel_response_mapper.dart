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

    final metadataParts = header?['content']?['pageHeaderViewModel']
            ?['metadata']['contentMetadataViewModel']['metadataRows'][1]
        ['metadataParts'];

    String? videoCount;
    String? subscriberCount;

    if (metadataParts != null) {
      if (metadataParts.length == 1) {
        videoCount = metadataParts[0]['text']['content'];
      } else if (metadataParts.length == 2) {
        subscriberCount = metadataParts[0]['text']['content'];
        videoCount = metadataParts[1]['text']['content'];
      }
    }

    return Channel(
      channelId: metadata?['externalId'],
      title: metadata?['title'],
      description: metadata?['description'],
      videoCount: videoCount,
      subscriberCount: subscriberCount,
      channelHandleText: header?['content']?['pageHeaderViewModel']?['metadata']
              ['contentMetadataViewModel']['metadataRows'][0]['metadataParts']
          [0]['text']['content'],
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
