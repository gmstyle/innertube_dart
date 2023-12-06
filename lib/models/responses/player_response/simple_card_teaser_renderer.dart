import 'dart:convert';

import 'message.dart';
import 'on_tap_command.dart';

class SimpleCardTeaserRenderer {
  Message? message;
  String? trackingParams;
  bool? prominent;
  bool? logVisibilityUpdates;
  OnTapCommand? onTapCommand;

  SimpleCardTeaserRenderer({
    this.message,
    this.trackingParams,
    this.prominent,
    this.logVisibilityUpdates,
    this.onTapCommand,
  });

  factory SimpleCardTeaserRenderer.fromMap(Map<String, dynamic> data) {
    return SimpleCardTeaserRenderer(
      message: data['message'] == null
          ? null
          : Message.fromMap(data['message'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
      prominent: data['prominent'] as bool?,
      logVisibilityUpdates: data['logVisibilityUpdates'] as bool?,
      onTapCommand: data['onTapCommand'] == null
          ? null
          : OnTapCommand.fromMap(data['onTapCommand'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message?.toMap(),
        'trackingParams': trackingParams,
        'prominent': prominent,
        'logVisibilityUpdates': logVisibilityUpdates,
        'onTapCommand': onTapCommand?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SimpleCardTeaserRenderer].
  factory SimpleCardTeaserRenderer.fromJson(String data) {
    return SimpleCardTeaserRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SimpleCardTeaserRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
