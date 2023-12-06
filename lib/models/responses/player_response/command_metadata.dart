import 'dart:convert';

import 'web_command_metadata.dart';

class CommandMetadata {
  WebCommandMetadata? webCommandMetadata;

  CommandMetadata({this.webCommandMetadata});

  factory CommandMetadata.fromMap(Map<String, dynamic> data) {
    return CommandMetadata(
      webCommandMetadata: data['webCommandMetadata'] == null
          ? null
          : WebCommandMetadata.fromMap(
              data['webCommandMetadata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'webCommandMetadata': webCommandMetadata?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommandMetadata].
  factory CommandMetadata.fromJson(String data) {
    return CommandMetadata.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommandMetadata] to a JSON string.
  String toJson() => json.encode(toMap());
}
