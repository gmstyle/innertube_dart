import 'dart:convert';

class ErrorPing {
  String? baseUrl;

  ErrorPing({this.baseUrl});

  factory ErrorPing.fromMap(Map<String, dynamic> data) => ErrorPing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ErrorPing].
  factory ErrorPing.fromJson(String data) {
    return ErrorPing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ErrorPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
