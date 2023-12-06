import 'dart:convert';

import 'run.dart';

class Text {
  List<Run>? runs;

  Text({this.runs});

  factory Text.fromMap(Map<String, dynamic> data) => Text(
        runs: (data['runs'] as List<dynamic>?)
            ?.map((e) => Run.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'runs': runs?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Text].
  factory Text.fromJson(String data) {
    return Text.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Text] to a JSON string.
  String toJson() => json.encode(toMap());
}
