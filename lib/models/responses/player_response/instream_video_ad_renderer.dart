import 'dart:convert';

import 'ad_layout_logging_data.dart';
import 'clickthrough_endpoint.dart';
import 'csi_parameter.dart';
import 'pings.dart';
import 'player_overlay.dart';
import 'sodar_extension_data.dart';

class InstreamVideoAdRenderer {
  Pings? pings;
  ClickthroughEndpoint? clickthroughEndpoint;
  List<CsiParameter>? csiParameters;
  String? playerVars;
  PlayerOverlay? playerOverlay;
  String? elementId;
  String? trackingParams;
  String? legacyInfoCardVastExtension;
  SodarExtensionData? sodarExtensionData;
  String? externalVideoId;
  AdLayoutLoggingData? adLayoutLoggingData;
  String? layoutId;

  InstreamVideoAdRenderer({
    this.pings,
    this.clickthroughEndpoint,
    this.csiParameters,
    this.playerVars,
    this.playerOverlay,
    this.elementId,
    this.trackingParams,
    this.legacyInfoCardVastExtension,
    this.sodarExtensionData,
    this.externalVideoId,
    this.adLayoutLoggingData,
    this.layoutId,
  });

  factory InstreamVideoAdRenderer.fromMap(Map<String, dynamic> data) {
    return InstreamVideoAdRenderer(
      pings: data['pings'] == null
          ? null
          : Pings.fromMap(data['pings'] as Map<String, dynamic>),
      clickthroughEndpoint: data['clickthroughEndpoint'] == null
          ? null
          : ClickthroughEndpoint.fromMap(
              data['clickthroughEndpoint'] as Map<String, dynamic>),
      csiParameters: (data['csiParameters'] as List<dynamic>?)
          ?.map((e) => CsiParameter.fromMap(e as Map<String, dynamic>))
          .toList(),
      playerVars: data['playerVars'] as String?,
      playerOverlay: data['playerOverlay'] == null
          ? null
          : PlayerOverlay.fromMap(
              data['playerOverlay'] as Map<String, dynamic>),
      elementId: data['elementId'] as String?,
      trackingParams: data['trackingParams'] as String?,
      legacyInfoCardVastExtension:
          data['legacyInfoCardVastExtension'] as String?,
      sodarExtensionData: data['sodarExtensionData'] == null
          ? null
          : SodarExtensionData.fromMap(
              data['sodarExtensionData'] as Map<String, dynamic>),
      externalVideoId: data['externalVideoId'] as String?,
      adLayoutLoggingData: data['adLayoutLoggingData'] == null
          ? null
          : AdLayoutLoggingData.fromMap(
              data['adLayoutLoggingData'] as Map<String, dynamic>),
      layoutId: data['layoutId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'pings': pings?.toMap(),
        'clickthroughEndpoint': clickthroughEndpoint?.toMap(),
        'csiParameters': csiParameters?.map((e) => e.toMap()).toList(),
        'playerVars': playerVars,
        'playerOverlay': playerOverlay?.toMap(),
        'elementId': elementId,
        'trackingParams': trackingParams,
        'legacyInfoCardVastExtension': legacyInfoCardVastExtension,
        'sodarExtensionData': sodarExtensionData?.toMap(),
        'externalVideoId': externalVideoId,
        'adLayoutLoggingData': adLayoutLoggingData?.toMap(),
        'layoutId': layoutId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InstreamVideoAdRenderer].
  factory InstreamVideoAdRenderer.fromJson(String data) {
    return InstreamVideoAdRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InstreamVideoAdRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
