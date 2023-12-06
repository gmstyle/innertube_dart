import 'dart:convert';

import 'browse_endpoint.dart';
import 'command_metadata.dart';

class NavigationEndpoint {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  BrowseEndpoint? browseEndpoint;

  NavigationEndpoint({
    this.clickTrackingParams,
    this.commandMetadata,
    this.browseEndpoint,
  });

  factory NavigationEndpoint.fromMap(Map<String, dynamic> data) {
    return NavigationEndpoint(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      browseEndpoint: data['browseEndpoint'] == null
          ? null
          : BrowseEndpoint.fromMap(
              data['browseEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'browseEndpoint': browseEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NavigationEndpoint].
  factory NavigationEndpoint.fromJson(String data) {
    return NavigationEndpoint.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NavigationEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
