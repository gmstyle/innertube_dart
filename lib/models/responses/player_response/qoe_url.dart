import 'dart:convert';

class QoeUrl {
  String? baseUrl;

  QoeUrl({this.baseUrl});

  factory QoeUrl.fromMap(Map<String, dynamic> data) => QoeUrl(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QoeUrl].
  factory QoeUrl.fromJson(String data) {
    return QoeUrl.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QoeUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
