import 'dart:convert';

class InitRange {
  String? start;
  String? end;

  InitRange({this.start, this.end});

  factory InitRange.fromMap(Map<String, dynamic> data) => InitRange(
        start: data['start'] as String?,
        end: data['end'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'start': start,
        'end': end,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InitRange].
  factory InitRange.fromJson(String data) {
    return InitRange.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InitRange] to a JSON string.
  String toJson() => json.encode(toMap());
}
