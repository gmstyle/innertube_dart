import 'dart:convert';

class PtrackingUrl {
  String? baseUrl;

  PtrackingUrl({this.baseUrl});

  factory PtrackingUrl.fromMap(Map<String, dynamic> data) => PtrackingUrl(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PtrackingUrl].
  factory PtrackingUrl.fromJson(String data) {
    return PtrackingUrl.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PtrackingUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
