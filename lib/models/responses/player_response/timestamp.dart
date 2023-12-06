import 'dart:convert';

class Timestamp {
  String? seconds;
  int? nanos;

  Timestamp({this.seconds, this.nanos});

  factory Timestamp.fromMap(Map<String, dynamic> data) => Timestamp(
        seconds: data['seconds'] as String?,
        nanos: data['nanos'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'seconds': seconds,
        'nanos': nanos,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Timestamp].
  factory Timestamp.fromJson(String data) {
    return Timestamp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Timestamp] to a JSON string.
  String toJson() => json.encode(toMap());
}
