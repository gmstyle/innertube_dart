import 'dart:convert';

class RewindPing {
  String? baseUrl;

  RewindPing({this.baseUrl});

  factory RewindPing.fromMap(Map<String, dynamic> data) => RewindPing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RewindPing].
  factory RewindPing.fromJson(String data) {
    return RewindPing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RewindPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
