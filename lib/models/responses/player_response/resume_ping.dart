import 'dart:convert';

class ResumePing {
  String? baseUrl;

  ResumePing({this.baseUrl});

  factory ResumePing.fromMap(Map<String, dynamic> data) => ResumePing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResumePing].
  factory ResumePing.fromJson(String data) {
    return ResumePing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResumePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
