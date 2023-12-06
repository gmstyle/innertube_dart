import 'dart:convert';

class UrlEndpoint {
  String? url;
  String? target;

  UrlEndpoint({this.url, this.target});

  factory UrlEndpoint.fromMap(Map<String, dynamic> data) => UrlEndpoint(
        url: data['url'] as String?,
        target: data['target'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'target': target,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UrlEndpoint].
  factory UrlEndpoint.fromJson(String data) {
    return UrlEndpoint.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UrlEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
