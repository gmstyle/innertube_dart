import 'package:innertube_dart/models/responses/thumbnail.dart'
    as innertube_thumbnail;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Video {
  String? videoId;
  String? title;
  String? description;
  String? lengthSeconds;
  List<String>? keywords;
  String? channelId;
  List<innertube_thumbnail.Thumbnail>? thumbnails;
  String? viewCount;
  String? author;
  String? muxedStreamingUrl;

  Video({
    this.videoId,
    this.title,
    this.description,
    this.lengthSeconds,
    this.keywords,
    this.channelId,
    this.thumbnails,
    this.viewCount,
    this.author,
    this.muxedStreamingUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
      videoId: json['videoId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      lengthSeconds: json['lengthSeconds'] as String?,
      keywords: json['keywords'],
      channelId: json['channelId'] as String?,
      thumbnails: json['thumbnails'] != null
          ? (json['thumbnails'] as List<dynamic>)
              .map((e) => innertube_thumbnail.Thumbnail.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          : null,
      viewCount: json['viewCount'] as String?,
      author: json['author'] as String?,
      muxedStreamingUrl: json['muxedStreamingUrl'] as String?);

  Map<String, dynamic> toJson() => {
        'videoId': videoId,
        'title': title,
        'description': description,
        'lengthSeconds': lengthSeconds,
        'keywords': keywords,
        'channelId': channelId,
        'thumbnails': thumbnails?.map((e) => e.toJson()).toList(),
        'viewCount': viewCount,
        'author': author,
        'muxedStreamingUrl': muxedStreamingUrl,
      };
}
