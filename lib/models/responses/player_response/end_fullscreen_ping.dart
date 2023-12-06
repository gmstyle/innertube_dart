import 'dart:convert';

class EndFullscreenPing {
  String? baseUrl;

  EndFullscreenPing({this.baseUrl});

  factory EndFullscreenPing.fromMap(Map<String, dynamic> data) {
    return EndFullscreenPing(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EndFullscreenPing].
  factory EndFullscreenPing.fromJson(String data) {
    return EndFullscreenPing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EndFullscreenPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
