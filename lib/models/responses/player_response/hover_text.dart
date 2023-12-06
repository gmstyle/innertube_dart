import 'dart:convert';

class HoverText {
  String? simpleText;

  HoverText({this.simpleText});

  factory HoverText.fromMap(Map<String, dynamic> data) => HoverText(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HoverText].
  factory HoverText.fromJson(String data) {
    return HoverText.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HoverText] to a JSON string.
  String toJson() => json.encode(toMap());
}
