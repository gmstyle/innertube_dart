import 'dart:convert';

import 'run.dart';

class UnsubscribedButtonText {
  List<Run>? runs;

  UnsubscribedButtonText({this.runs});

  factory UnsubscribedButtonText.fromMap(Map<String, dynamic> data) {
    return UnsubscribedButtonText(
      runs: (data['runs'] as List<dynamic>?)
          ?.map((e) => Run.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'runs': runs?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UnsubscribedButtonText].
  factory UnsubscribedButtonText.fromJson(String data) {
    return UnsubscribedButtonText.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnsubscribedButtonText] to a JSON string.
  String toJson() => json.encode(toMap());
}
