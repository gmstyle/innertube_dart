import 'dart:convert';

import 'command_metadata.dart';
import 'url_endpoint.dart';

class ClickthroughEndpoint {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  UrlEndpoint? urlEndpoint;

  ClickthroughEndpoint({
    this.clickTrackingParams,
    this.commandMetadata,
    this.urlEndpoint,
  });

  factory ClickthroughEndpoint.fromMap(Map<String, dynamic> data) {
    return ClickthroughEndpoint(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      urlEndpoint: data['urlEndpoint'] == null
          ? null
          : UrlEndpoint.fromMap(data['urlEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'urlEndpoint': urlEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ClickthroughEndpoint].
  factory ClickthroughEndpoint.fromJson(String data) {
    return ClickthroughEndpoint.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ClickthroughEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
