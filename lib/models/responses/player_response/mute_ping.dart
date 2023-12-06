import 'dart:convert';

class MutePing {
  String? baseUrl;

  MutePing({this.baseUrl});

  factory MutePing.fromMap(Map<String, dynamic> data) => MutePing(
        baseUrl: data['baseUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MutePing].
  factory MutePing.fromJson(String data) {
    return MutePing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MutePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
