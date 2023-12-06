import 'dart:convert';

import 'accessibility.dart';
import 'service_endpoint.dart';
import 'text.dart';

class ButtonRenderer {
  String? style;
  String? size;
  bool? isDisabled;
  Text? text;
  ServiceEndpoint? serviceEndpoint;
  Accessibility? accessibility;
  String? trackingParams;

  ButtonRenderer({
    this.style,
    this.size,
    this.isDisabled,
    this.text,
    this.serviceEndpoint,
    this.accessibility,
    this.trackingParams,
  });

  factory ButtonRenderer.fromMap(Map<String, dynamic> data) {
    return ButtonRenderer(
      style: data['style'] as String?,
      size: data['size'] as String?,
      isDisabled: data['isDisabled'] as bool?,
      text: data['text'] == null
          ? null
          : Text.fromMap(data['text'] as Map<String, dynamic>),
      serviceEndpoint: data['serviceEndpoint'] == null
          ? null
          : ServiceEndpoint.fromMap(
              data['serviceEndpoint'] as Map<String, dynamic>),
      accessibility: data['accessibility'] == null
          ? null
          : Accessibility.fromMap(
              data['accessibility'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'style': style,
        'size': size,
        'isDisabled': isDisabled,
        'text': text?.toMap(),
        'serviceEndpoint': serviceEndpoint?.toMap(),
        'accessibility': accessibility?.toMap(),
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ButtonRenderer].
  factory ButtonRenderer.fromJson(String data) {
    return ButtonRenderer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ButtonRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
