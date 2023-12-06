import 'dart:convert';

import 'info_card_icon_renderer.dart';

class CloseButton {
  InfoCardIconRenderer? infoCardIconRenderer;

  CloseButton({this.infoCardIconRenderer});

  factory CloseButton.fromMap(Map<String, dynamic> data) => CloseButton(
        infoCardIconRenderer: data['infoCardIconRenderer'] == null
            ? null
            : InfoCardIconRenderer.fromMap(
                data['infoCardIconRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'infoCardIconRenderer': infoCardIconRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CloseButton].
  factory CloseButton.fromJson(String data) {
    return CloseButton.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CloseButton] to a JSON string.
  String toJson() => json.encode(toMap());
}
