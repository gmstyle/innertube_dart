import 'dart:convert';

class Description {
  String? simpleText;

  Description({this.simpleText});

  factory Description.fromMap(Map<String, dynamic> data) => Description(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Description].
  factory Description.fromJson(String data) {
    return Description.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Description] to a JSON string.
  String toJson() => json.encode(toMap());
}
