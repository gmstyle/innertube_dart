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
    return Video(
        videoId: data['videoDetails']['videoId'],
        title: data['videoDetails']['title'],
        description: data['videoDetails']['shortDescription'],
        lengthSeconds: data['videoDetails']['lengthSeconds'],
        keywords: (data['videoDetails']['keywords'] as List<dynamic>)
            .map<String>((e) => e as String)
            .toList(),
        channelId: data['videoDetails']['channelId'],
        thumbnails:
            (data['videoDetails']['thumbnail']['thumbnails'] as List<dynamic>)
                .map<Thumbnail>((e) => Thumbnail(
                      url: e['url'],
                      width: e['width'],
                      height: e['height'],
                    ))
                .toList(),
        viewCount: data['videoDetails']['viewCount'],
        author: data['videoDetails']['author'],
        streamingData: StreamingData.fromJson(data['streamingData']));
  }
}
