import 'dart:convert';

class AudioConfig {
  double? loudnessDb;
  double? perceptualLoudnessDb;
  bool? enablePerFormatLoudness;

  AudioConfig({
    this.loudnessDb,
    this.perceptualLoudnessDb,
    this.enablePerFormatLoudness,
  });

  factory AudioConfig.fromMap(Map<String, dynamic> data) => AudioConfig(
        loudnessDb: (data['loudnessDb'] as num?)?.toDouble(),
        perceptualLoudnessDb:
            (data['perceptualLoudnessDb'] as num?)?.toDouble(),
        enablePerFormatLoudness: data['enablePerFormatLoudness'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'loudnessDb': loudnessDb,
        'perceptualLoudnessDb': perceptualLoudnessDb,
        'enablePerFormatLoudness': enablePerFormatLoudness,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AudioConfig].
  factory AudioConfig.fromJson(String data) {
    return AudioConfig.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AudioConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
