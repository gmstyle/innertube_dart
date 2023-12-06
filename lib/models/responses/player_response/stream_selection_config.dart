import 'dart:convert';

class StreamSelectionConfig {
  String? maxBitrate;

  StreamSelectionConfig({this.maxBitrate});

  factory StreamSelectionConfig.fromMap(Map<String, dynamic> data) {
    return StreamSelectionConfig(
      maxBitrate: data['maxBitrate'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'maxBitrate': maxBitrate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StreamSelectionConfig].
  factory StreamSelectionConfig.fromJson(String data) {
    return StreamSelectionConfig.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StreamSelectionConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
