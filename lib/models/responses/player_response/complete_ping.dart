import 'dart:convert';

class CompletePing {
  String? baseUrl;

  CompletePing({this.baseUrl});

  factory CompletePing.fromMap(Map<String, dynamic> data) => CompletePing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CompletePing].
  factory CompletePing.fromJson(String data) {
    return CompletePing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CompletePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
