import 'dart:convert';

class LanguageName {
  String? simpleText;

  LanguageName({this.simpleText});

  factory LanguageName.fromMap(Map<String, dynamic> data) => LanguageName(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LanguageName].
  factory LanguageName.fromJson(String data) {
    return LanguageName.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LanguageName] to a JSON string.
  String toJson() => json.encode(toMap());
}
