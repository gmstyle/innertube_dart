import 'dart:convert';

import 'color_info.dart';
import 'index_range.dart';
import 'init_range.dart';

class AdaptiveFormat {
  int? itag;
  String? url;
  String? mimeType;
  int? bitrate;
  int? width;
  int? height;
  InitRange? initRange;
  IndexRange? indexRange;
  String? lastModified;
  String? contentLength;
  String? quality;
  int? fps;
  String? qualityLabel;
  String? projectionType;
  int? averageBitrate;
  String? approxDurationMs;
  ColorInfo? colorInfo;
  bool? highReplication;
  String? audioQuality;
  String? audioSampleRate;
  int? audioChannels;
  double? loudnessDb;

  AdaptiveFormat({
    this.itag,
    this.url,
    this.mimeType,
    this.bitrate,
    this.width,
    this.height,
    this.initRange,
    this.indexRange,
    this.lastModified,
    this.contentLength,
    this.quality,
    this.fps,
    this.qualityLabel,
    this.projectionType,
    this.averageBitrate,
    this.approxDurationMs,
    this.colorInfo,
    this.highReplication,
    this.audioQuality,
    this.audioSampleRate,
    this.audioChannels,
    this.loudnessDb,
  });

  factory AdaptiveFormat.fromMap(Map<String, dynamic> data) {
    return AdaptiveFormat(
      itag: data['itag'] as int?,
      url: data['url'] as String?,
      mimeType: data['mimeType'] as String?,
      bitrate: data['bitrate'] as int?,
      width: data['width'] as int?,
      height: data['height'] as int?,
      initRange: data['initRange'] == null
          ? null
          : InitRange.fromMap(data['initRange'] as Map<String, dynamic>),
      indexRange: data['indexRange'] == null
          ? null
          : IndexRange.fromMap(data['indexRange'] as Map<String, dynamic>),
      lastModified: data['lastModified'] as String?,
      contentLength: data['contentLength'] as String?,
      quality: data['quality'] as String?,
      fps: data['fps'] as int?,
      qualityLabel: data['qualityLabel'] as String?,
      projectionType: data['projectionType'] as String?,
      averageBitrate: data['averageBitrate'] as int?,
      approxDurationMs: data['approxDurationMs'] as String?,
      colorInfo: data['colorInfo'] == null
          ? null
          : ColorInfo.fromMap(data['colorInfo'] as Map<String, dynamic>),
      highReplication: data['highReplication'] as bool?,
      audioQuality: data['audioQuality'] as String?,
      audioSampleRate: data['audioSampleRate'] as String?,
      audioChannels: data['audioChannels'] as int?,
      loudnessDb: (data['loudnessDb'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'itag': itag,
        'url': url,
        'mimeType': mimeType,
        'bitrate': bitrate,
        'width': width,
        'height': height,
        'initRange': initRange?.toMap(),
        'indexRange': indexRange?.toMap(),
        'lastModified': lastModified,
        'contentLength': contentLength,
        'quality': quality,
        'fps': fps,
        'qualityLabel': qualityLabel,
        'projectionType': projectionType,
        'averageBitrate': averageBitrate,
        'approxDurationMs': approxDurationMs,
        'colorInfo': colorInfo?.toMap(),
        'highReplication': highReplication,
        'audioQuality': audioQuality,
        'audioSampleRate': audioSampleRate,
        'audioChannels': audioChannels,
        'loudnessDb': loudnessDb,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdaptiveFormat].
  factory AdaptiveFormat.fromJson(String data) {
    return AdaptiveFormat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdaptiveFormat] to a JSON string.
  String toJson() => json.encode(toMap());
}
