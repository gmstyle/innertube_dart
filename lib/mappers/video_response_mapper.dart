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
    final videoDetails = data['response']['videoDetails'];
    return Video(
      videoId: videoDetails['videoId'],
      title: videoDetails['title'],
      description: videoDetails['shortDescription'],
      lengthSeconds: videoDetails['lengthSeconds'],
      keywords: (videoDetails['keywords'] != null)
          ? (videoDetails['keywords'] as List<dynamic>)
              .map<String>((e) => e as String)
              .toList()
          : null,
      channelId: videoDetails['channelId'],
      thumbnails: (videoDetails['thumbnail']['thumbnails'] as List<dynamic>)
          .map<Thumbnail>((e) => Thumbnail.fromJson(e))
          .toList(),
      viewCount: videoDetails['viewCount'],
      author: videoDetails['author'],
      muxedStreamingUrl: data['muxedStreamingUrl'],
      durationMs: getDuration(data, videoDetails),
    );
  }

  String? getDuration(Map<String, dynamic> data, videoDetails) {
    String? duration;

    if (data['response']['streamingData'] != null) {
      if (data['response']['streamingData']['formats'] != null) {
        if (data['response']['streamingData']['formats'] != null) {
          duration = data['response']['streamingData']['formats'][0]
              ['approxDurationMs'];
        } else {
          duration = data['response']['streamingData']['adaptiveFormats'][0]
              ['approxDurationMs'];
        }
      } else {
        duration = (int.parse(videoDetails['lengthSeconds'] as String) * 1000)
            .toString();
      }
    }
    return duration;
  }
}
