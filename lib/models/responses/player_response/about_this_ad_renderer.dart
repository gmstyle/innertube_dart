import 'dart:convert';

import 'url.dart';

class AboutThisAdRenderer {
  Url? url;
  String? trackingParams;

  AboutThisAdRenderer({this.url, this.trackingParams});

  factory AboutThisAdRenderer.fromMap(Map<String, dynamic> data) {
    return AboutThisAdRenderer(
      url: data['url'] == null
          ? null
          : Url.fromMap(data['url'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url?.toMap(),
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AboutThisAdRenderer].
  factory AboutThisAdRenderer.fromJson(String data) {
    return AboutThisAdRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AboutThisAdRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
