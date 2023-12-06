import 'dart:convert';

import 'command_metadata.dart';
import 'unsubscribe_endpoint.dart';

class UnsubscribeCommand {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  UnsubscribeEndpoint? unsubscribeEndpoint;

  UnsubscribeCommand({
    this.clickTrackingParams,
    this.commandMetadata,
    this.unsubscribeEndpoint,
  });

  factory UnsubscribeCommand.fromMap(Map<String, dynamic> data) {
    return UnsubscribeCommand(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      unsubscribeEndpoint: data['unsubscribeEndpoint'] == null
          ? null
          : UnsubscribeEndpoint.fromMap(
              data['unsubscribeEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'unsubscribeEndpoint': unsubscribeEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UnsubscribeCommand].
  factory UnsubscribeCommand.fromJson(String data) {
    return UnsubscribeCommand.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnsubscribeCommand] to a JSON string.
  String toJson() => json.encode(toMap());
}
