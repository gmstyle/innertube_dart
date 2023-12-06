import 'dart:convert';

import 'popup.dart';

class OpenPopupAction {
  Popup? popup;
  String? popupType;

  OpenPopupAction({this.popup, this.popupType});

  factory OpenPopupAction.fromMap(Map<String, dynamic> data) {
    return OpenPopupAction(
      popup: data['popup'] == null
          ? null
          : Popup.fromMap(data['popup'] as Map<String, dynamic>),
      popupType: data['popupType'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'popup': popup?.toMap(),
        'popupType': popupType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OpenPopupAction].
  factory OpenPopupAction.fromJson(String data) {
    return OpenPopupAction.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OpenPopupAction] to a JSON string.
  String toJson() => json.encode(toMap());
}
