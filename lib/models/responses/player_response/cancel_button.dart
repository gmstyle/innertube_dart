import 'dart:convert';

import 'button_renderer.dart';

class CancelButton {
  ButtonRenderer? buttonRenderer;

  CancelButton({this.buttonRenderer});

  factory CancelButton.fromMap(Map<String, dynamic> data) => CancelButton(
        buttonRenderer: data['buttonRenderer'] == null
            ? null
            : ButtonRenderer.fromMap(
                data['buttonRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'buttonRenderer': buttonRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CancelButton].
  factory CancelButton.fromJson(String data) {
    return CancelButton.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CancelButton] to a JSON string.
  String toJson() => json.encode(toMap());
}
