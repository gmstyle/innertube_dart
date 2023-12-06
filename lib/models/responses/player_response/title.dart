import 'dart:convert';

class Title {
  String? simpleText;

  Title({this.simpleText});

  factory Title.fromMap(Map<String, dynamic> data) => Title(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Title].
  factory Title.fromJson(String data) {
    return Title.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Title] to a JSON string.
  String toJson() => json.encode(toMap());
}
