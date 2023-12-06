import 'dart:convert';

import 'info_card_icon_renderer.dart';

class Icon {
  InfoCardIconRenderer? infoCardIconRenderer;

  Icon({this.infoCardIconRenderer});

  factory Icon.fromMap(Map<String, dynamic> data) => Icon(
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
  /// Parses the string and returns the resulting Json object as [Icon].
  factory Icon.fromJson(String data) {
    return Icon.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Icon] to a JSON string.
  String toJson() => json.encode(toMap());
}
