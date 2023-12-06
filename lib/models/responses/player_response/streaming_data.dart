import 'dart:convert';

import 'adaptive_format.dart';
import 'format.dart';

class StreamingData {
  String? expiresInSeconds;
  List<Format>? formats;
  List<AdaptiveFormat>? adaptiveFormats;

  StreamingData({
    this.expiresInSeconds,
    this.formats,
    this.adaptiveFormats,
  });

  factory StreamingData.fromMap(Map<String, dynamic> data) => StreamingData(
        expiresInSeconds: data['expiresInSeconds'] as String?,
        formats: (data['formats'] as List<dynamic>?)
            ?.map((e) => Format.fromMap(e as Map<String, dynamic>))
            .toList(),
        adaptiveFormats: (data['adaptiveFormats'] as List<dynamic>?)
            ?.map((e) => AdaptiveFormat.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'expiresInSeconds': expiresInSeconds,
        'formats': formats?.map((e) => e.toMap()).toList(),
        'adaptiveFormats': adaptiveFormats?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StreamingData].
  factory StreamingData.fromJson(String data) {
    return StreamingData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StreamingData] to a JSON string.
  String toJson() => json.encode(toMap());
}
