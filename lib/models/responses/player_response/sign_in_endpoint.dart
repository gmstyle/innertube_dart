import 'dart:convert';

import 'command_metadata.dart';

class SignInEndpoint {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;

  SignInEndpoint({this.clickTrackingParams, this.commandMetadata});

  factory SignInEndpoint.fromMap(Map<String, dynamic> data) {
    return SignInEndpoint(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignInEndpoint].
  factory SignInEndpoint.fromJson(String data) {
    return SignInEndpoint.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SignInEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
