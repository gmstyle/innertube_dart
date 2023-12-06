import 'dart:convert';

class IndexRange {
  String? start;
  String? end;

  IndexRange({this.start, this.end});

  factory IndexRange.fromMap(Map<String, dynamic> data) => IndexRange(
        start: data['start'] as String?,
        end: data['end'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'start': start,
        'end': end,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IndexRange].
  factory IndexRange.fromJson(String data) {
    return IndexRange.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IndexRange] to a JSON string.
  String toJson() => json.encode(toMap());
}
