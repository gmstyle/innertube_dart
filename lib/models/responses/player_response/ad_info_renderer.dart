import 'dart:convert';

import 'ad_hover_text_button_renderer.dart';

class AdInfoRenderer {
  AdHoverTextButtonRenderer? adHoverTextButtonRenderer;

  AdInfoRenderer({this.adHoverTextButtonRenderer});

  factory AdInfoRenderer.fromMap(Map<String, dynamic> data) {
    return AdInfoRenderer(
      adHoverTextButtonRenderer: data['adHoverTextButtonRenderer'] == null
          ? null
          : AdHoverTextButtonRenderer.fromMap(
              data['adHoverTextButtonRenderer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'adHoverTextButtonRenderer': adHoverTextButtonRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdInfoRenderer].
  factory AdInfoRenderer.fromJson(String data) {
    return AdInfoRenderer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdInfoRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
