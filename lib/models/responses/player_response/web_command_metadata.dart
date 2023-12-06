import 'dart:convert';

class WebCommandMetadata {
  String? url;
  String? webPageType;
  int? rootVe;
  String? apiUrl;

  WebCommandMetadata({
    this.url,
    this.webPageType,
    this.rootVe,
    this.apiUrl,
  });

  factory WebCommandMetadata.fromMap(Map<String, dynamic> data) {
    return WebCommandMetadata(
      url: data['url'] as String?,
      webPageType: data['webPageType'] as String?,
      rootVe: data['rootVe'] as int?,
      apiUrl: data['apiUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'webPageType': webPageType,
        'rootVe': rootVe,
        'apiUrl': apiUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WebCommandMetadata].
  factory WebCommandMetadata.fromJson(String data) {
    return WebCommandMetadata.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WebCommandMetadata] to a JSON string.
  String toJson() => json.encode(toMap());
}
