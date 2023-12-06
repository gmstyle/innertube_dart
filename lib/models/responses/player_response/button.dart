import 'dart:convert';

import 'button_renderer.dart';

class Button {
  ButtonRenderer? buttonRenderer;

  Button({this.buttonRenderer});

  factory Button.fromMap(Map<String, dynamic> data) => Button(
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
  /// Parses the string and returns the resulting Json object as [Button].
  factory Button.fromJson(String data) {
    return Button.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Button] to a JSON string.
  String toJson() => json.encode(toMap());
}
