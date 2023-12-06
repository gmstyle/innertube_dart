import 'dart:convert';

import 'run.dart';

class SubscribedButtonText {
  List<Run>? runs;

  SubscribedButtonText({this.runs});

  factory SubscribedButtonText.fromMap(Map<String, dynamic> data) {
    return SubscribedButtonText(
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
  /// Parses the string and returns the resulting Json object as [SubscribedButtonText].
  factory SubscribedButtonText.fromJson(String data) {
    return SubscribedButtonText.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscribedButtonText] to a JSON string.
  String toJson() => json.encode(toMap());
}
