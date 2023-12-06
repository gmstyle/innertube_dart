import 'dart:convert';

class CueRange {
  String? startCardActiveMs;
  String? endCardActiveMs;
  String? teaserDurationMs;
  String? iconAfterTeaserMs;

  CueRange({
    this.startCardActiveMs,
    this.endCardActiveMs,
    this.teaserDurationMs,
    this.iconAfterTeaserMs,
  });

  factory CueRange.fromMap(Map<String, dynamic> data) => CueRange(
        startCardActiveMs: data['startCardActiveMs'] as String?,
        endCardActiveMs: data['endCardActiveMs'] as String?,
        teaserDurationMs: data['teaserDurationMs'] as String?,
        iconAfterTeaserMs: data['iconAfterTeaserMs'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'startCardActiveMs': startCardActiveMs,
        'endCardActiveMs': endCardActiveMs,
        'teaserDurationMs': teaserDurationMs,
        'iconAfterTeaserMs': iconAfterTeaserMs,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CueRange].
  factory CueRange.fromJson(String data) {
    return CueRange.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CueRange] to a JSON string.
  String toJson() => json.encode(toMap());
}
