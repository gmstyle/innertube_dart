import 'dart:convert';

import 'templated_ad_text.dart';

class TemplatedCountdown {
  TemplatedAdText? templatedAdText;

  TemplatedCountdown({this.templatedAdText});

  factory TemplatedCountdown.fromMap(Map<String, dynamic> data) {
    return TemplatedCountdown(
      templatedAdText: data['templatedAdText'] == null
          ? null
          : TemplatedAdText.fromMap(
              data['templatedAdText'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'templatedAdText': templatedAdText?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TemplatedCountdown].
  factory TemplatedCountdown.fromJson(String data) {
    return TemplatedCountdown.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TemplatedCountdown] to a JSON string.
  String toJson() => json.encode(toMap());
}
