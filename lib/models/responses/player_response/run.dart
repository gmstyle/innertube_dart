import 'dart:convert';

class Run {
  String? text;

  Run({this.text});

  factory Run.fromMap(Map<String, dynamic> data) => Run(
        text: data['text'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Run].
  factory Run.fromJson(String data) {
    return Run.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Run] to a JSON string.
  String toJson() => json.encode(toMap());
}
