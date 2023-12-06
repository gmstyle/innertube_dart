import 'dart:convert';

import 'web_player_actions_porting.dart';

class WebPlayerConfig {
  bool? useCobaltTvosDash;
  WebPlayerActionsPorting? webPlayerActionsPorting;

  WebPlayerConfig({this.useCobaltTvosDash, this.webPlayerActionsPorting});

  factory WebPlayerConfig.fromMap(Map<String, dynamic> data) {
    return WebPlayerConfig(
      useCobaltTvosDash: data['useCobaltTvosDash'] as bool?,
      webPlayerActionsPorting: data['webPlayerActionsPorting'] == null
          ? null
          : WebPlayerActionsPorting.fromMap(
              data['webPlayerActionsPorting'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'useCobaltTvosDash': useCobaltTvosDash,
        'webPlayerActionsPorting': webPlayerActionsPorting?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WebPlayerConfig].
  factory WebPlayerConfig.fromJson(String data) {
    return WebPlayerConfig.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WebPlayerConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
