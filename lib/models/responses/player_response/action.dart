import 'dart:convert';

import 'open_popup_action.dart';

class Action {
  String? clickTrackingParams;
  OpenPopupAction? openPopupAction;

  Action({this.clickTrackingParams, this.openPopupAction});

  factory Action.fromMap(Map<String, dynamic> data) => Action(
        clickTrackingParams: data['clickTrackingParams'] as String?,
        openPopupAction: data['openPopupAction'] == null
            ? null
            : OpenPopupAction.fromMap(
                data['openPopupAction'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'openPopupAction': openPopupAction?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Action].
  factory Action.fromJson(String data) {
    return Action.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Action] to a JSON string.
  String toJson() => json.encode(toMap());
}
