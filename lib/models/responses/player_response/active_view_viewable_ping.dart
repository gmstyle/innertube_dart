import 'dart:convert';

class ActiveViewViewablePing {
  String? baseUrl;

  ActiveViewViewablePing({this.baseUrl});

  factory ActiveViewViewablePing.fromMap(Map<String, dynamic> data) {
    return ActiveViewViewablePing(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ActiveViewViewablePing].
  factory ActiveViewViewablePing.fromJson(String data) {
    return ActiveViewViewablePing.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ActiveViewViewablePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
