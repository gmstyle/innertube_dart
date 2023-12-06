import 'dart:convert';

import 'audio_config.dart';
import 'media_common_config.dart';
import 'stream_selection_config.dart';
import 'web_player_config.dart';

class PlayerConfig {
  AudioConfig? audioConfig;
  StreamSelectionConfig? streamSelectionConfig;
  MediaCommonConfig? mediaCommonConfig;
  WebPlayerConfig? webPlayerConfig;

  PlayerConfig({
    this.audioConfig,
    this.streamSelectionConfig,
    this.mediaCommonConfig,
    this.webPlayerConfig,
  });

  factory PlayerConfig.fromMap(Map<String, dynamic> data) => PlayerConfig(
        audioConfig: data['audioConfig'] == null
            ? null
            : AudioConfig.fromMap(data['audioConfig'] as Map<String, dynamic>),
        streamSelectionConfig: data['streamSelectionConfig'] == null
            ? null
            : StreamSelectionConfig.fromMap(
                data['streamSelectionConfig'] as Map<String, dynamic>),
        mediaCommonConfig: data['mediaCommonConfig'] == null
            ? null
            : MediaCommonConfig.fromMap(
                data['mediaCommonConfig'] as Map<String, dynamic>),
        webPlayerConfig: data['webPlayerConfig'] == null
            ? null
            : WebPlayerConfig.fromMap(
                data['webPlayerConfig'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'audioConfig': audioConfig?.toMap(),
        'streamSelectionConfig': streamSelectionConfig?.toMap(),
        'mediaCommonConfig': mediaCommonConfig?.toMap(),
        'webPlayerConfig': webPlayerConfig?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerConfig].
  factory PlayerConfig.fromJson(String data) {
    return PlayerConfig.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
