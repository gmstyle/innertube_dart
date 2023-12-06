import 'dart:convert';

import 'run.dart';

class ButtonText {
  List<Run>? runs;

  ButtonText({this.runs});

  factory ButtonText.fromMap(Map<String, dynamic> data) => ButtonText(
        runs: (data['runs'] as List<dynamic>?)
            ?.map((e) => Run.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'runs': runs?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ButtonText].
  factory ButtonText.fromJson(String data) {
    return ButtonText.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ButtonText] to a JSON string.
  String toJson() => json.encode(toMap());
}
