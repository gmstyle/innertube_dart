import 'dart:convert';

import 'command_metadata.dart';
import 'web_player_share_entity_service_endpoint.dart';

class GetSharePanelCommand {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  WebPlayerShareEntityServiceEndpoint? webPlayerShareEntityServiceEndpoint;

  GetSharePanelCommand({
    this.clickTrackingParams,
    this.commandMetadata,
    this.webPlayerShareEntityServiceEndpoint,
  });

  factory GetSharePanelCommand.fromMap(Map<String, dynamic> data) {
    return GetSharePanelCommand(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      webPlayerShareEntityServiceEndpoint:
          data['webPlayerShareEntityServiceEndpoint'] == null
              ? null
              : WebPlayerShareEntityServiceEndpoint.fromMap(
                  data['webPlayerShareEntityServiceEndpoint']
                      as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'webPlayerShareEntityServiceEndpoint':
            webPlayerShareEntityServiceEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetSharePanelCommand].
  factory GetSharePanelCommand.fromJson(String data) {
    return GetSharePanelCommand.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetSharePanelCommand] to a JSON string.
  String toJson() => json.encode(toMap());
}
