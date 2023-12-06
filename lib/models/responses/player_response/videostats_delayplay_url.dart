import 'dart:convert';

class VideostatsDelayplayUrl {
  String? baseUrl;

  VideostatsDelayplayUrl({this.baseUrl});

  factory VideostatsDelayplayUrl.fromMap(Map<String, dynamic> data) {
    return VideostatsDelayplayUrl(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideostatsDelayplayUrl].
  factory VideostatsDelayplayUrl.fromJson(String data) {
    return VideostatsDelayplayUrl.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideostatsDelayplayUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
