import 'dart:convert';

import 'command_metadata.dart';
import 'signal_service_endpoint.dart';
import 'subscribe_endpoint.dart';

class ServiceEndpoint {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  SubscribeEndpoint? subscribeEndpoint;
  SignalServiceEndpoint? signalServiceEndpoint;

  ServiceEndpoint({
    this.clickTrackingParams,
    this.commandMetadata,
    this.subscribeEndpoint,
    this.signalServiceEndpoint,
  });

  factory ServiceEndpoint.fromMap(Map<String, dynamic> data) {
    return ServiceEndpoint(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      subscribeEndpoint: data['subscribeEndpoint'] == null
          ? null
          : SubscribeEndpoint.fromMap(
              data['subscribeEndpoint'] as Map<String, dynamic>),
      signalServiceEndpoint: data['signalServiceEndpoint'] == null
          ? null
          : SignalServiceEndpoint.fromMap(
              data['signalServiceEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'subscribeEndpoint': subscribeEndpoint?.toMap(),
        'signalServiceEndpoint': signalServiceEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceEndpoint].
  factory ServiceEndpoint.fromJson(String data) {
    return ServiceEndpoint.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
