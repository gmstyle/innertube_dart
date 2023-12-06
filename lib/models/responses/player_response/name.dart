import 'dart:convert';

class Name {
  String? simpleText;

  Name({this.simpleText});

  factory Name.fromMap(Map<String, dynamic> data) => Name(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Name].
  factory Name.fromJson(String data) {
    return Name.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Name] to a JSON string.
  String toJson() => json.encode(toMap());
}
