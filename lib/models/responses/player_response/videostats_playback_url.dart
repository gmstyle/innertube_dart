import 'dart:convert';

class VideostatsPlaybackUrl {
  String? baseUrl;

  VideostatsPlaybackUrl({this.baseUrl});

  factory VideostatsPlaybackUrl.fromMap(Map<String, dynamic> data) {
    return VideostatsPlaybackUrl(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideostatsPlaybackUrl].
  factory VideostatsPlaybackUrl.fromJson(String data) {
    return VideostatsPlaybackUrl.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideostatsPlaybackUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
