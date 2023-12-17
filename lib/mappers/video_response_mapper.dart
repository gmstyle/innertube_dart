import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/thumbnail.dart';
import 'package:innertube_dart/models/responses/video.dart';

class VideoResponseMapper implements BaseMapper<Video, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Video model) {
    throw UnimplementedError();
  }

  @override
  Video toModel(Map<String, dynamic> data) {
    final videoDetails = data['videoDetails'];
    return Video(
        videoId: videoDetails['videoId'],
        title: videoDetails['title'],
        description: videoDetails['shortDescription'],
        lengthSeconds: videoDetails['lengthSeconds'],
        keywords: (videoDetails['keywords'] as List<dynamic>)
            .map<String>((e) => e as String)
            .toList(),
        channelId: videoDetails['channelId'],
        thumbnails: (videoDetails['thumbnail']['thumbnails'] as List<dynamic>)
            .map<Thumbnail>((e) => Thumbnail(
                  url: e['url'],
                  width: e['width'],
                  height: e['height'],
                ))
            .toList(),
        viewCount: videoDetails['viewCount'],
        author: videoDetails['author'],
        muxedStreamingUrl: data['muxedStreamingUrl']);
  }
}
