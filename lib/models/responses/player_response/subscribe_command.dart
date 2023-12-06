import 'dart:convert';

import 'command_metadata.dart';
import 'subscribe_endpoint.dart';

class SubscribeCommand {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  SubscribeEndpoint? subscribeEndpoint;

  SubscribeCommand({
    this.clickTrackingParams,
    this.commandMetadata,
    this.subscribeEndpoint,
  });

  factory SubscribeCommand.fromMap(Map<String, dynamic> data) {
    return SubscribeCommand(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      subscribeEndpoint: data['subscribeEndpoint'] == null
          ? null
          : SubscribeEndpoint.fromMap(
              data['subscribeEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'subscribeEndpoint': subscribeEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscribeCommand].
  factory SubscribeCommand.fromJson(String data) {
    return SubscribeCommand.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscribeCommand] to a JSON string.
  String toJson() => json.encode(toMap());
}
