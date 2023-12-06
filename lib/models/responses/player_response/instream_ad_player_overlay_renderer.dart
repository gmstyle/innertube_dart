import 'dart:convert';

import 'ad_badge_renderer.dart';
import 'ad_duration_remaining.dart';
import 'ad_info_renderer.dart';
import 'ad_layout_logging_data.dart';
import 'skip_or_preview_renderer.dart';
import 'visit_advertiser_renderer.dart';

class InstreamAdPlayerOverlayRenderer {
  SkipOrPreviewRenderer? skipOrPreviewRenderer;
  String? trackingParams;
  VisitAdvertiserRenderer? visitAdvertiserRenderer;
  AdBadgeRenderer? adBadgeRenderer;
  AdDurationRemaining? adDurationRemaining;
  AdInfoRenderer? adInfoRenderer;
  AdLayoutLoggingData? adLayoutLoggingData;
  String? elementId;
  String? inPlayerSlotId;
  String? inPlayerLayoutId;

  InstreamAdPlayerOverlayRenderer({
    this.skipOrPreviewRenderer,
    this.trackingParams,
    this.visitAdvertiserRenderer,
    this.adBadgeRenderer,
    this.adDurationRemaining,
    this.adInfoRenderer,
    this.adLayoutLoggingData,
    this.elementId,
    this.inPlayerSlotId,
    this.inPlayerLayoutId,
  });

  factory InstreamAdPlayerOverlayRenderer.fromMap(Map<String, dynamic> data) {
    return InstreamAdPlayerOverlayRenderer(
      skipOrPreviewRenderer: data['skipOrPreviewRenderer'] == null
          ? null
          : SkipOrPreviewRenderer.fromMap(
              data['skipOrPreviewRenderer'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
      visitAdvertiserRenderer: data['visitAdvertiserRenderer'] == null
          ? null
          : VisitAdvertiserRenderer.fromMap(
              data['visitAdvertiserRenderer'] as Map<String, dynamic>),
      adBadgeRenderer: data['adBadgeRenderer'] == null
          ? null
          : AdBadgeRenderer.fromMap(
              data['adBadgeRenderer'] as Map<String, dynamic>),
      adDurationRemaining: data['adDurationRemaining'] == null
          ? null
          : AdDurationRemaining.fromMap(
              data['adDurationRemaining'] as Map<String, dynamic>),
      adInfoRenderer: data['adInfoRenderer'] == null
          ? null
          : AdInfoRenderer.fromMap(
              data['adInfoRenderer'] as Map<String, dynamic>),
      adLayoutLoggingData: data['adLayoutLoggingData'] == null
          ? null
          : AdLayoutLoggingData.fromMap(
              data['adLayoutLoggingData'] as Map<String, dynamic>),
      elementId: data['elementId'] as String?,
      inPlayerSlotId: data['inPlayerSlotId'] as String?,
      inPlayerLayoutId: data['inPlayerLayoutId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'skipOrPreviewRenderer': skipOrPreviewRenderer?.toMap(),
        'trackingParams': trackingParams,
        'visitAdvertiserRenderer': visitAdvertiserRenderer?.toMap(),
        'adBadgeRenderer': adBadgeRenderer?.toMap(),
        'adDurationRemaining': adDurationRemaining?.toMap(),
        'adInfoRenderer': adInfoRenderer?.toMap(),
        'adLayoutLoggingData': adLayoutLoggingData?.toMap(),
        'elementId': elementId,
        'inPlayerSlotId': inPlayerSlotId,
        'inPlayerLayoutId': inPlayerLayoutId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InstreamAdPlayerOverlayRenderer].
  factory InstreamAdPlayerOverlayRenderer.fromJson(String data) {
    return InstreamAdPlayerOverlayRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InstreamAdPlayerOverlayRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
