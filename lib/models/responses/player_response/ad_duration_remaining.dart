import 'dart:convert';

import 'ad_duration_remaining_renderer.dart';

class AdDurationRemaining {
  AdDurationRemainingRenderer? adDurationRemainingRenderer;

  AdDurationRemaining({this.adDurationRemainingRenderer});

  factory AdDurationRemaining.fromMap(Map<String, dynamic> data) {
    return AdDurationRemaining(
      adDurationRemainingRenderer: data['adDurationRemainingRenderer'] == null
          ? null
          : AdDurationRemainingRenderer.fromMap(
              data['adDurationRemainingRenderer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'adDurationRemainingRenderer': adDurationRemainingRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdDurationRemaining].
  factory AdDurationRemaining.fromJson(String data) {
    return AdDurationRemaining.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdDurationRemaining] to a JSON string.
  String toJson() => json.encode(toMap());
}
