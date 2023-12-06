import 'dart:convert';

class AbandonPing {
  String? baseUrl;

  AbandonPing({this.baseUrl});

  factory AbandonPing.fromMap(Map<String, dynamic> data) => AbandonPing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AbandonPing].
  factory AbandonPing.fromJson(String data) {
    return AbandonPing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AbandonPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
