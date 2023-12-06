import 'dart:convert';

import 'change_engagement_panel_visibility_action.dart';

class OnTapCommand {
  String? clickTrackingParams;
  ChangeEngagementPanelVisibilityAction? changeEngagementPanelVisibilityAction;

  OnTapCommand({
    this.clickTrackingParams,
    this.changeEngagementPanelVisibilityAction,
  });

  factory OnTapCommand.fromMap(Map<String, dynamic> data) => OnTapCommand(
        clickTrackingParams: data['clickTrackingParams'] as String?,
        changeEngagementPanelVisibilityAction:
            data['changeEngagementPanelVisibilityAction'] == null
                ? null
                : ChangeEngagementPanelVisibilityAction.fromMap(
                    data['changeEngagementPanelVisibilityAction']
                        as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'changeEngagementPanelVisibilityAction':
            changeEngagementPanelVisibilityAction?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OnTapCommand].
  factory OnTapCommand.fromJson(String data) {
    return OnTapCommand.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OnTapCommand] to a JSON string.
  String toJson() => json.encode(toMap());
}
