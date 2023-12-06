import 'dart:convert';

import 'add_to_watch_later_command.dart';
import 'get_share_panel_command.dart';
import 'remove_from_watch_later_command.dart';
import 'subscribe_command.dart';
import 'unsubscribe_command.dart';

class WebPlayerActionsPorting {
  GetSharePanelCommand? getSharePanelCommand;
  SubscribeCommand? subscribeCommand;
  UnsubscribeCommand? unsubscribeCommand;
  AddToWatchLaterCommand? addToWatchLaterCommand;
  RemoveFromWatchLaterCommand? removeFromWatchLaterCommand;

  WebPlayerActionsPorting({
    this.getSharePanelCommand,
    this.subscribeCommand,
    this.unsubscribeCommand,
    this.addToWatchLaterCommand,
    this.removeFromWatchLaterCommand,
  });

  factory WebPlayerActionsPorting.fromMap(Map<String, dynamic> data) {
    return WebPlayerActionsPorting(
      getSharePanelCommand: data['getSharePanelCommand'] == null
          ? null
          : GetSharePanelCommand.fromMap(
              data['getSharePanelCommand'] as Map<String, dynamic>),
      subscribeCommand: data['subscribeCommand'] == null
          ? null
          : SubscribeCommand.fromMap(
              data['subscribeCommand'] as Map<String, dynamic>),
      unsubscribeCommand: data['unsubscribeCommand'] == null
          ? null
          : UnsubscribeCommand.fromMap(
              data['unsubscribeCommand'] as Map<String, dynamic>),
      addToWatchLaterCommand: data['addToWatchLaterCommand'] == null
          ? null
          : AddToWatchLaterCommand.fromMap(
              data['addToWatchLaterCommand'] as Map<String, dynamic>),
      removeFromWatchLaterCommand: data['removeFromWatchLaterCommand'] == null
          ? null
          : RemoveFromWatchLaterCommand.fromMap(
              data['removeFromWatchLaterCommand'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'getSharePanelCommand': getSharePanelCommand?.toMap(),
        'subscribeCommand': subscribeCommand?.toMap(),
        'unsubscribeCommand': unsubscribeCommand?.toMap(),
        'addToWatchLaterCommand': addToWatchLaterCommand?.toMap(),
        'removeFromWatchLaterCommand': removeFromWatchLaterCommand?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WebPlayerActionsPorting].
  factory WebPlayerActionsPorting.fromJson(String data) {
    return WebPlayerActionsPorting.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WebPlayerActionsPorting] to a JSON string.
  String toJson() => json.encode(toMap());
}
