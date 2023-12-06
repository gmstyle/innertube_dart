import 'dart:convert';

import 'interpreter_safe_url.dart';

class BotguardData {
  String? program;
  InterpreterSafeUrl? interpreterSafeUrl;
  int? serverEnvironment;

  BotguardData({
    this.program,
    this.interpreterSafeUrl,
    this.serverEnvironment,
  });

  factory BotguardData.fromMap(Map<String, dynamic> data) => BotguardData(
        program: data['program'] as String?,
        interpreterSafeUrl: data['interpreterSafeUrl'] == null
            ? null
            : InterpreterSafeUrl.fromMap(
                data['interpreterSafeUrl'] as Map<String, dynamic>),
        serverEnvironment: data['serverEnvironment'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'program': program,
        'interpreterSafeUrl': interpreterSafeUrl?.toMap(),
        'serverEnvironment': serverEnvironment,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BotguardData].
  factory BotguardData.fromJson(String data) {
    return BotguardData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BotguardData] to a JSON string.
  String toJson() => json.encode(toMap());
}
