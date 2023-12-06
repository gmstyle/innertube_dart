import 'dart:convert';

class InterpreterSafeUrl {
  String? privateDoNotAccessOrElseTrustedResourceUrlWrappedValue;

  InterpreterSafeUrl({
    this.privateDoNotAccessOrElseTrustedResourceUrlWrappedValue,
  });

  factory InterpreterSafeUrl.fromMap(Map<String, dynamic> data) {
    return InterpreterSafeUrl(
      privateDoNotAccessOrElseTrustedResourceUrlWrappedValue:
          data['privateDoNotAccessOrElseTrustedResourceUrlWrappedValue']
              as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'privateDoNotAccessOrElseTrustedResourceUrlWrappedValue':
            privateDoNotAccessOrElseTrustedResourceUrlWrappedValue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InterpreterSafeUrl].
  factory InterpreterSafeUrl.fromJson(String data) {
    return InterpreterSafeUrl.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InterpreterSafeUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
