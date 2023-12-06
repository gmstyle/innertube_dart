import 'dart:convert';

class AdTimeOffset {
  String? offsetStartMilliseconds;
  String? offsetEndMilliseconds;

  AdTimeOffset({this.offsetStartMilliseconds, this.offsetEndMilliseconds});

  factory AdTimeOffset.fromMap(Map<String, dynamic> data) => AdTimeOffset(
        offsetStartMilliseconds: data['offsetStartMilliseconds'] as String?,
        offsetEndMilliseconds: data['offsetEndMilliseconds'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'offsetStartMilliseconds': offsetStartMilliseconds,
        'offsetEndMilliseconds': offsetEndMilliseconds,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdTimeOffset].
  factory AdTimeOffset.fromJson(String data) {
    return AdTimeOffset.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdTimeOffset] to a JSON string.
  String toJson() => json.encode(toMap());
}
