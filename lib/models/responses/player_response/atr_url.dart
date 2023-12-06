import 'dart:convert';

class AtrUrl {
  String? baseUrl;
  int? elapsedMediaTimeSeconds;

  AtrUrl({this.baseUrl, this.elapsedMediaTimeSeconds});

  factory AtrUrl.fromMap(Map<String, dynamic> data) => AtrUrl(
        baseUrl: data['baseUrl'] as String?,
        elapsedMediaTimeSeconds: data['elapsedMediaTimeSeconds'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
        'elapsedMediaTimeSeconds': elapsedMediaTimeSeconds,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AtrUrl].
  factory AtrUrl.fromJson(String data) {
    return AtrUrl.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AtrUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
