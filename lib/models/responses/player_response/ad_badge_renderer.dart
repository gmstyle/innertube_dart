import 'dart:convert';

import 'simple_ad_badge_renderer.dart';

class AdBadgeRenderer {
  SimpleAdBadgeRenderer? simpleAdBadgeRenderer;

  AdBadgeRenderer({this.simpleAdBadgeRenderer});

  factory AdBadgeRenderer.fromMap(Map<String, dynamic> data) {
    return AdBadgeRenderer(
      simpleAdBadgeRenderer: data['simpleAdBadgeRenderer'] == null
          ? null
          : SimpleAdBadgeRenderer.fromMap(
              data['simpleAdBadgeRenderer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'simpleAdBadgeRenderer': simpleAdBadgeRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdBadgeRenderer].
  factory AdBadgeRenderer.fromJson(String data) {
    return AdBadgeRenderer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdBadgeRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
