import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/video.dart';

class VideoMapper implements BaseMapper<Video, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Video model) {
    throw UnimplementedError();
  }

  @override
  Video toModel(Map<String, dynamic> data) {
    return Video(
      videoId: data['videoDetails']['videoId'],
      title: data['videoDetails']['title'],
      lengthSeconds: data['videoDetails']['lengthSeconds'],
      keywords: data['videoDetails']['keywords'],
      channelId: data['videoDetails']['channelId'],
      thumbnails: data['videoDetails']['thumbnail']['thumbnails'],
      viewCount: data['videoDetails']['viewCount'],
      author: data['videoDetails']['author'],
      streamingData: data['streamingData'],
    );
  }
}
