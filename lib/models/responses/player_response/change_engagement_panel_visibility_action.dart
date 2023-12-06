import 'dart:convert';

class ChangeEngagementPanelVisibilityAction {
  String? targetId;
  String? visibility;

  ChangeEngagementPanelVisibilityAction({this.targetId, this.visibility});

  factory ChangeEngagementPanelVisibilityAction.fromMap(
      Map<String, dynamic> data) {
    return ChangeEngagementPanelVisibilityAction(
      targetId: data['targetId'] as String?,
      visibility: data['visibility'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'targetId': targetId,
        'visibility': visibility,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChangeEngagementPanelVisibilityAction].
  factory ChangeEngagementPanelVisibilityAction.fromJson(String data) {
    return ChangeEngagementPanelVisibilityAction.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChangeEngagementPanelVisibilityAction] to a JSON string.
  String toJson() => json.encode(toMap());
}
