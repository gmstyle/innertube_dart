import 'dart:convert';

class VideostatsWatchtimeUrl {
  String? baseUrl;

  VideostatsWatchtimeUrl({this.baseUrl});

  factory VideostatsWatchtimeUrl.fromMap(Map<String, dynamic> data) {
    return VideostatsWatchtimeUrl(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideostatsWatchtimeUrl].
  factory VideostatsWatchtimeUrl.fromJson(String data) {
    return VideostatsWatchtimeUrl.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideostatsWatchtimeUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
