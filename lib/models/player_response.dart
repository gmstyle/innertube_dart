import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'player_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerResponse {
  final PlayabilityStatus? playabilityStatus;
  final StreamingData? streamingData;
  final PlayerConfig? playerConfig;
  final VideoDetails? videoDetails;

  PlayerResponse(
      {this.playabilityStatus,
      this.streamingData,
      this.playerConfig,
      this.videoDetails});

  factory PlayerResponse.fromJson(Map<String, dynamic> json) {
    return _$PlayerResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlayerResponseToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PlayabilityStatus {
  final String? playabilityStatus;

  PlayabilityStatus({this.playabilityStatus});

  factory PlayabilityStatus.fromJson(Map<String, dynamic> json) {
    return _$PlayabilityStatusFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlayabilityStatusToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PlayerConfig {
  final AudioConfig? audioConfig;

  PlayerConfig({this.audioConfig});

  factory PlayerConfig.fromJson(Map<String, dynamic> json) {
    return _$PlayerConfigFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlayerConfigToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class AudioConfig {
  final double? loudnessDb;

  AudioConfig({this.loudnessDb});

  factory AudioConfig.fromJson(Map<String, dynamic> json) {
    return _$AudioConfigFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AudioConfigToJson(this);
  }

  double? get normalizedLoudnessDb {
    return loudnessDb != null ? (loudnessDb! + 7).toDouble() : null;
  }
}

@JsonSerializable(explicitToJson: true)
class StreamingData {
  final List<AdaptiveFormat>? adaptiveFormats;

  StreamingData({this.adaptiveFormats});

  factory StreamingData.fromJson(Map<String, dynamic> json) {
    return _$StreamingDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StreamingDataToJson(this);
  }

  AdaptiveFormat? get highestQualityFormat {
    return adaptiveFormats
        ?.lastWhere((element) => element.itag == 251 || element.itag == 140);
  }
}

@JsonSerializable(explicitToJson: true)
class AdaptiveFormat {
  final int itag;
  final int mimeType;
  final double? bitrate;
  final double? averageBitrate;
  final double? contentLength;
  final String? audioQuality;
  final double? approxDurationMs;
  final double? lastModified;
  final double? loudnessDb;
  final int? audioSampleRate;
  final String? url;

  AdaptiveFormat(
      {required this.itag,
      required this.mimeType,
      this.bitrate,
      this.averageBitrate,
      this.contentLength,
      this.audioQuality,
      this.approxDurationMs,
      this.lastModified,
      this.loudnessDb,
      this.audioSampleRate,
      this.url});

  factory AdaptiveFormat.fromJson(Map<String, dynamic> json) {
    return _$AdaptiveFormatFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdaptiveFormatToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class VideoDetails {
  final String? videoId;

  VideoDetails({this.videoId});

  factory VideoDetails.fromJson(Map<String, dynamic> json) {
    return _$VideoDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VideoDetailsToJson(this);
  }
}
