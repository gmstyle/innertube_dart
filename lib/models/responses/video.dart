import 'package:innertube_dart/models/responses/thumbnail.dart';

class Video {
  String? videoId;
  String? title;
  String? description;
  String? lengthSeconds;
  List<String>? keywords;
  String? channelId;
  List<Thumbnail>? thumbnails;
  String? viewCount;
  String? author;
  StreamingData? streamingData;

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
    this.streamingData,
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
                .map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
        viewCount: json['viewCount'] as String?,
        author: json['author'] as String?,
        streamingData: StreamingData.fromJson(
            json['streamingData'] as Map<String, dynamic>),
      );

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
        'streamingData': streamingData,
      };
}

class StreamingData {
  List<Format>? formats;
  List<Format>? adaptiveFormats;

  StreamingData({
    this.formats,
    this.adaptiveFormats,
  });

  factory StreamingData.fromJson(Map<String, dynamic> json) => StreamingData(
        formats: (json['formats'] as List<dynamic>)
            .map((e) => Format.fromJson(e as Map<String, dynamic>))
            .toList(),
        adaptiveFormats: (json['adaptiveFormats'] as List<dynamic>)
            .map((e) => Format.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Format {
  int? width;
  int? height;
  String? mimeType;
  int? bitrate;
  String? quality;
  String? qualityLabel;
  int? fps;
  String? approxDurationMs;

  Format({
    this.width,
    this.height,
    this.mimeType,
    this.bitrate,
    this.quality,
    this.qualityLabel,
    this.fps,
    this.approxDurationMs,
  });

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        width: json['width'] as int?,
        height: json['height'] as int?,
        mimeType: json['mimeType'] as String?,
        bitrate: json['bitrate'] as int?,
        quality: json['quality'] as String?,
        qualityLabel: json['qualityLabel'] as String?,
        fps: json['fps'] as int?,
        approxDurationMs: json['approxDurationMs'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'mimeType': mimeType,
        'bitrate': bitrate,
        'quality': quality,
        'qualityLabel': qualityLabel,
        'fps': fps,
        'approxDurationMs': approxDurationMs,
      };
}
