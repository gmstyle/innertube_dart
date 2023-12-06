import 'dart:convert';

import 'navigation_endpoint.dart';
import 'subscribe_button.dart';
import 'watermark.dart';

class FeaturedChannel {
  String? startTimeMs;
  String? endTimeMs;
  Watermark? watermark;
  String? trackingParams;
  NavigationEndpoint? navigationEndpoint;
  String? channelName;
  SubscribeButton? subscribeButton;

  FeaturedChannel({
    this.startTimeMs,
    this.endTimeMs,
    this.watermark,
    this.trackingParams,
    this.navigationEndpoint,
    this.channelName,
    this.subscribeButton,
  });

  factory FeaturedChannel.fromMap(Map<String, dynamic> data) {
    return FeaturedChannel(
      startTimeMs: data['startTimeMs'] as String?,
      endTimeMs: data['endTimeMs'] as String?,
      watermark: data['watermark'] == null
          ? null
          : Watermark.fromMap(data['watermark'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
      navigationEndpoint: data['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromMap(
              data['navigationEndpoint'] as Map<String, dynamic>),
      channelName: data['channelName'] as String?,
      subscribeButton: data['subscribeButton'] == null
          ? null
          : SubscribeButton.fromMap(
              data['subscribeButton'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'startTimeMs': startTimeMs,
        'endTimeMs': endTimeMs,
        'watermark': watermark?.toMap(),
        'trackingParams': trackingParams,
        'navigationEndpoint': navigationEndpoint?.toMap(),
        'channelName': channelName,
        'subscribeButton': subscribeButton?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FeaturedChannel].
  factory FeaturedChannel.fromJson(String data) {
    return FeaturedChannel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FeaturedChannel] to a JSON string.
  String toJson() => json.encode(toMap());
}
