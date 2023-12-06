import 'dart:convert';

import 'cancel_button.dart';
import 'confirm_button.dart';
import 'dialog_message.dart';

class ConfirmDialogRenderer {
  String? trackingParams;
  List<DialogMessage>? dialogMessages;
  ConfirmButton? confirmButton;
  CancelButton? cancelButton;
  bool? primaryIsCancel;

  ConfirmDialogRenderer({
    this.trackingParams,
    this.dialogMessages,
    this.confirmButton,
    this.cancelButton,
    this.primaryIsCancel,
  });

  factory ConfirmDialogRenderer.fromMap(Map<String, dynamic> data) {
    return ConfirmDialogRenderer(
      trackingParams: data['trackingParams'] as String?,
      dialogMessages: (data['dialogMessages'] as List<dynamic>?)
          ?.map((e) => DialogMessage.fromMap(e as Map<String, dynamic>))
          .toList(),
      confirmButton: data['confirmButton'] == null
          ? null
          : ConfirmButton.fromMap(
              data['confirmButton'] as Map<String, dynamic>),
      cancelButton: data['cancelButton'] == null
          ? null
          : CancelButton.fromMap(data['cancelButton'] as Map<String, dynamic>),
      primaryIsCancel: data['primaryIsCancel'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'trackingParams': trackingParams,
        'dialogMessages': dialogMessages?.map((e) => e.toMap()).toList(),
        'confirmButton': confirmButton?.toMap(),
        'cancelButton': cancelButton?.toMap(),
        'primaryIsCancel': primaryIsCancel,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ConfirmDialogRenderer].
  factory ConfirmDialogRenderer.fromJson(String data) {
    return ConfirmDialogRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ConfirmDialogRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
