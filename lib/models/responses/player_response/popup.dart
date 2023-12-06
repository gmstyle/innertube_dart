import 'dart:convert';

import 'confirm_dialog_renderer.dart';

class Popup {
  ConfirmDialogRenderer? confirmDialogRenderer;

  Popup({this.confirmDialogRenderer});

  factory Popup.fromMap(Map<String, dynamic> data) => Popup(
        confirmDialogRenderer: data['confirmDialogRenderer'] == null
            ? null
            : ConfirmDialogRenderer.fromMap(
                data['confirmDialogRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'confirmDialogRenderer': confirmDialogRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Popup].
  factory Popup.fromJson(String data) {
    return Popup.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Popup] to a JSON string.
  String toJson() => json.encode(toMap());
}
