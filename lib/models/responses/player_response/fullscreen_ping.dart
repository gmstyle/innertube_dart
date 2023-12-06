import 'dart:convert';

class FullscreenPing {
  String? baseUrl;

  FullscreenPing({this.baseUrl});

  factory FullscreenPing.fromMap(Map<String, dynamic> data) {
    return FullscreenPing(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FullscreenPing].
  factory FullscreenPing.fromJson(String data) {
    return FullscreenPing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FullscreenPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
