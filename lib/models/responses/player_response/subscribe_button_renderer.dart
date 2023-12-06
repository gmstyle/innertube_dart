import 'dart:convert';

import 'button_text.dart';
import 'service_endpoint.dart';
import 'sign_in_endpoint.dart';
import 'subscribe_accessibility.dart';
import 'subscribed_button_text.dart';
import 'unsubscribe_accessibility.dart';
import 'unsubscribe_button_text.dart';
import 'unsubscribed_button_text.dart';

class SubscribeButtonRenderer {
  ButtonText? buttonText;
  bool? subscribed;
  bool? enabled;
  String? type;
  String? channelId;
  bool? showPreferences;
  SubscribedButtonText? subscribedButtonText;
  UnsubscribedButtonText? unsubscribedButtonText;
  String? trackingParams;
  UnsubscribeButtonText? unsubscribeButtonText;
  List<ServiceEndpoint>? serviceEndpoints;
  SubscribeAccessibility? subscribeAccessibility;
  UnsubscribeAccessibility? unsubscribeAccessibility;
  SignInEndpoint? signInEndpoint;

  SubscribeButtonRenderer({
    this.buttonText,
    this.subscribed,
    this.enabled,
    this.type,
    this.channelId,
    this.showPreferences,
    this.subscribedButtonText,
    this.unsubscribedButtonText,
    this.trackingParams,
    this.unsubscribeButtonText,
    this.serviceEndpoints,
    this.subscribeAccessibility,
    this.unsubscribeAccessibility,
    this.signInEndpoint,
  });

  factory SubscribeButtonRenderer.fromMap(Map<String, dynamic> data) {
    return SubscribeButtonRenderer(
      buttonText: data['buttonText'] == null
          ? null
          : ButtonText.fromMap(data['buttonText'] as Map<String, dynamic>),
      subscribed: data['subscribed'] as bool?,
      enabled: data['enabled'] as bool?,
      type: data['type'] as String?,
      channelId: data['channelId'] as String?,
      showPreferences: data['showPreferences'] as bool?,
      subscribedButtonText: data['subscribedButtonText'] == null
          ? null
          : SubscribedButtonText.fromMap(
              data['subscribedButtonText'] as Map<String, dynamic>),
      unsubscribedButtonText: data['unsubscribedButtonText'] == null
          ? null
          : UnsubscribedButtonText.fromMap(
              data['unsubscribedButtonText'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
      unsubscribeButtonText: data['unsubscribeButtonText'] == null
          ? null
          : UnsubscribeButtonText.fromMap(
              data['unsubscribeButtonText'] as Map<String, dynamic>),
      serviceEndpoints: (data['serviceEndpoints'] as List<dynamic>?)
          ?.map((e) => ServiceEndpoint.fromMap(e as Map<String, dynamic>))
          .toList(),
      subscribeAccessibility: data['subscribeAccessibility'] == null
          ? null
          : SubscribeAccessibility.fromMap(
              data['subscribeAccessibility'] as Map<String, dynamic>),
      unsubscribeAccessibility: data['unsubscribeAccessibility'] == null
          ? null
          : UnsubscribeAccessibility.fromMap(
              data['unsubscribeAccessibility'] as Map<String, dynamic>),
      signInEndpoint: data['signInEndpoint'] == null
          ? null
          : SignInEndpoint.fromMap(
              data['signInEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'buttonText': buttonText?.toMap(),
        'subscribed': subscribed,
        'enabled': enabled,
        'type': type,
        'channelId': channelId,
        'showPreferences': showPreferences,
        'subscribedButtonText': subscribedButtonText?.toMap(),
        'unsubscribedButtonText': unsubscribedButtonText?.toMap(),
        'trackingParams': trackingParams,
        'unsubscribeButtonText': unsubscribeButtonText?.toMap(),
        'serviceEndpoints': serviceEndpoints?.map((e) => e.toMap()).toList(),
        'subscribeAccessibility': subscribeAccessibility?.toMap(),
        'unsubscribeAccessibility': unsubscribeAccessibility?.toMap(),
        'signInEndpoint': signInEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscribeButtonRenderer].
  factory SubscribeButtonRenderer.fromJson(String data) {
    return SubscribeButtonRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscribeButtonRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
