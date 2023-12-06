import 'dart:convert';

class UnmutePing {
  String? baseUrl;

  UnmutePing({this.baseUrl});

  factory UnmutePing.fromMap(Map<String, dynamic> data) => UnmutePing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UnmutePing].
  factory UnmutePing.fromJson(String data) {
    return UnmutePing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnmutePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
