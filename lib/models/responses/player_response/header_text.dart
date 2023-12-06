import 'dart:convert';

class HeaderText {
  String? simpleText;

  HeaderText({this.simpleText});

  factory HeaderText.fromMap(Map<String, dynamic> data) => HeaderText(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HeaderText].
  factory HeaderText.fromJson(String data) {
    return HeaderText.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HeaderText] to a JSON string.
  String toJson() => json.encode(toMap());
}
