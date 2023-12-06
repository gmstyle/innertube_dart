import 'dart:convert';

class ClosePing {
  String? baseUrl;

  ClosePing({this.baseUrl});

  factory ClosePing.fromMap(Map<String, dynamic> data) => ClosePing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ClosePing].
  factory ClosePing.fromJson(String data) {
    return ClosePing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ClosePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
