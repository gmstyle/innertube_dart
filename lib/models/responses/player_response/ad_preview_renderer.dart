import 'dart:convert';

import 'static_preview.dart';

class AdPreviewRenderer {
  String? trackingParams;
  StaticPreview? staticPreview;

  AdPreviewRenderer({this.trackingParams, this.staticPreview});

  factory AdPreviewRenderer.fromMap(Map<String, dynamic> data) {
    return AdPreviewRenderer(
      trackingParams: data['trackingParams'] as String?,
      staticPreview: data['staticPreview'] == null
          ? null
          : StaticPreview.fromMap(
              data['staticPreview'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'trackingParams': trackingParams,
        'staticPreview': staticPreview?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdPreviewRenderer].
  factory AdPreviewRenderer.fromJson(String data) {
    return AdPreviewRenderer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdPreviewRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
