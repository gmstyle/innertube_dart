import 'dart:convert';

import 'templated_countdown.dart';

class AdDurationRemainingRenderer {
  TemplatedCountdown? templatedCountdown;
  String? trackingParams;

  AdDurationRemainingRenderer({
    this.templatedCountdown,
    this.trackingParams,
  });

  factory AdDurationRemainingRenderer.fromMap(Map<String, dynamic> data) {
    return AdDurationRemainingRenderer(
      templatedCountdown: data['templatedCountdown'] == null
          ? null
          : TemplatedCountdown.fromMap(
              data['templatedCountdown'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'templatedCountdown': templatedCountdown?.toMap(),
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdDurationRemainingRenderer].
  factory AdDurationRemainingRenderer.fromJson(String data) {
    return AdDurationRemainingRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdDurationRemainingRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
