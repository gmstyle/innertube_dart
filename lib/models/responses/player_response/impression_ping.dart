import 'dart:convert';

class ImpressionPing {
  String? baseUrl;

  ImpressionPing({this.baseUrl});

  factory ImpressionPing.fromMap(Map<String, dynamic> data) {
    return ImpressionPing(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ImpressionPing].
  factory ImpressionPing.fromJson(String data) {
    return ImpressionPing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ImpressionPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
