import 'dart:convert';

class PausePing {
  String? baseUrl;

  PausePing({this.baseUrl});

  factory PausePing.fromMap(Map<String, dynamic> data) => PausePing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PausePing].
  factory PausePing.fromJson(String data) {
    return PausePing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PausePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
