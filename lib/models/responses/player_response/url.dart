import 'dart:convert';

class Url {
  String? privateDoNotAccessOrElseTrustedResourceUrlWrappedValue;

  Url({this.privateDoNotAccessOrElseTrustedResourceUrlWrappedValue});

  factory Url.fromMap(Map<String, dynamic> data) => Url(
        privateDoNotAccessOrElseTrustedResourceUrlWrappedValue:
            data['privateDoNotAccessOrElseTrustedResourceUrlWrappedValue']
                as String?,
      );

  Map<String, dynamic> toMap() => {
        'privateDoNotAccessOrElseTrustedResourceUrlWrappedValue':
            privateDoNotAccessOrElseTrustedResourceUrlWrappedValue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Url].
  factory Url.fromJson(String data) {
    return Url.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Url] to a JSON string.
  String toJson() => json.encode(toMap());
}
