import 'dart:convert';

import 'subscribe_button_renderer.dart';

class SubscribeButton {
  SubscribeButtonRenderer? subscribeButtonRenderer;

  SubscribeButton({this.subscribeButtonRenderer});

  factory SubscribeButton.fromMap(Map<String, dynamic> data) {
    return SubscribeButton(
      subscribeButtonRenderer: data['subscribeButtonRenderer'] == null
          ? null
          : SubscribeButtonRenderer.fromMap(
              data['subscribeButtonRenderer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'subscribeButtonRenderer': subscribeButtonRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscribeButton].
  factory SubscribeButton.fromJson(String data) {
    return SubscribeButton.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscribeButton] to a JSON string.
  String toJson() => json.encode(toMap());
}
