import 'dart:convert';

import 'action.dart';

class SignalServiceEndpoint {
  String? signal;
  List<Action>? actions;

  SignalServiceEndpoint({this.signal, this.actions});

  factory SignalServiceEndpoint.fromMap(Map<String, dynamic> data) {
    return SignalServiceEndpoint(
      signal: data['signal'] as String?,
      actions: (data['actions'] as List<dynamic>?)
          ?.map((e) => Action.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'signal': signal,
        'actions': actions?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignalServiceEndpoint].
  factory SignalServiceEndpoint.fromJson(String data) {
    return SignalServiceEndpoint.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SignalServiceEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
