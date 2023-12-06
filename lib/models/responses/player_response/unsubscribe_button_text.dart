import 'dart:convert';

import 'run.dart';

class UnsubscribeButtonText {
  List<Run>? runs;

  UnsubscribeButtonText({this.runs});

  factory UnsubscribeButtonText.fromMap(Map<String, dynamic> data) {
    return UnsubscribeButtonText(
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
  /// Parses the string and returns the resulting Json object as [UnsubscribeButtonText].
  factory UnsubscribeButtonText.fromJson(String data) {
    return UnsubscribeButtonText.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnsubscribeButtonText] to a JSON string.
  String toJson() => json.encode(toMap());
}
