import 'dart:convert';

class Format {
  int? itag;
  String? url;
  String? mimeType;
  int? bitrate;
  int? width;
  int? height;
  String? lastModified;
  String? quality;
  int? fps;
  String? qualityLabel;
  String? projectionType;
  String? audioQuality;
  String? approxDurationMs;
  String? audioSampleRate;
  int? audioChannels;

  Format({
    this.itag,
    this.url,
    this.mimeType,
    this.bitrate,
    this.width,
    this.height,
    this.lastModified,
    this.quality,
    this.fps,
    this.qualityLabel,
    this.projectionType,
    this.audioQuality,
    this.approxDurationMs,
    this.audioSampleRate,
    this.audioChannels,
  });

  factory Format.fromMap(Map<String, dynamic> data) => Format(
        itag: data['itag'] as int?,
        url: data['url'] as String?,
        mimeType: data['mimeType'] as String?,
        bitrate: data['bitrate'] as int?,
        width: data['width'] as int?,
        height: data['height'] as int?,
        lastModified: data['lastModified'] as String?,
        quality: data['quality'] as String?,
        fps: data['fps'] as int?,
        qualityLabel: data['qualityLabel'] as String?,
        projectionType: data['projectionType'] as String?,
        audioQuality: data['audioQuality'] as String?,
        approxDurationMs: data['approxDurationMs'] as String?,
        audioSampleRate: data['audioSampleRate'] as String?,
        audioChannels: data['audioChannels'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'itag': itag,
        'url': url,
        'mimeType': mimeType,
        'bitrate': bitrate,
        'width': width,
        'height': height,
        'lastModified': lastModified,
        'quality': quality,
        'fps': fps,
        'qualityLabel': qualityLabel,
        'projectionType': projectionType,
        'audioQuality': audioQuality,
        'approxDurationMs': approxDurationMs,
        'audioSampleRate': audioSampleRate,
        'audioChannels': audioChannels,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Format].
  factory Format.fromJson(String data) {
    return Format.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Format] to a JSON string.
  String toJson() => json.encode(toMap());
}
