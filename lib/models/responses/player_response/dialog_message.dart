import 'dart:convert';

import 'run.dart';

class DialogMessage {
  List<Run>? runs;

  DialogMessage({this.runs});

  factory DialogMessage.fromMap(Map<String, dynamic> data) => DialogMessage(
        runs: (data['runs'] as List<dynamic>?)
            ?.map((e) => Run.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'runs': runs?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DialogMessage].
  factory DialogMessage.fromJson(String data) {
    return DialogMessage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DialogMessage] to a JSON string.
  String toJson() => json.encode(toMap());
}
