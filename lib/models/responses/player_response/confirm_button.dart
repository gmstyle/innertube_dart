import 'dart:convert';

import 'button_renderer.dart';

class ConfirmButton {
  ButtonRenderer? buttonRenderer;

  ConfirmButton({this.buttonRenderer});

  factory ConfirmButton.fromMap(Map<String, dynamic> data) => ConfirmButton(
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
  /// Parses the string and returns the resulting Json object as [ConfirmButton].
  factory ConfirmButton.fromJson(String data) {
    return ConfirmButton.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ConfirmButton] to a JSON string.
  String toJson() => json.encode(toMap());
}
