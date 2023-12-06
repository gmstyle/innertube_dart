import 'dart:convert';

import 'button.dart';
import 'hover_text.dart';

class AdHoverTextButtonRenderer {
  Button? button;
  HoverText? hoverText;
  String? trackingParams;

  AdHoverTextButtonRenderer({
    this.button,
    this.hoverText,
    this.trackingParams,
  });

  factory AdHoverTextButtonRenderer.fromMap(Map<String, dynamic> data) {
    return AdHoverTextButtonRenderer(
      button: data['button'] == null
          ? null
          : Button.fromMap(data['button'] as Map<String, dynamic>),
      hoverText: data['hoverText'] == null
          ? null
          : HoverText.fromMap(data['hoverText'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'button': button?.toMap(),
        'hoverText': hoverText?.toMap(),
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdHoverTextButtonRenderer].
  factory AdHoverTextButtonRenderer.fromJson(String data) {
    return AdHoverTextButtonRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdHoverTextButtonRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
