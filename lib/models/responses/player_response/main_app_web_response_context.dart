import 'dart:convert';

class MainAppWebResponseContext {
  bool? loggedOut;
  String? trackingParam;

  MainAppWebResponseContext({this.loggedOut, this.trackingParam});

  factory MainAppWebResponseContext.fromMap(Map<String, dynamic> data) {
    return MainAppWebResponseContext(
      loggedOut: data['loggedOut'] as bool?,
      trackingParam: data['trackingParam'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'loggedOut': loggedOut,
        'trackingParam': trackingParam,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MainAppWebResponseContext].
  factory MainAppWebResponseContext.fromJson(String data) {
    return MainAppWebResponseContext.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MainAppWebResponseContext] to a JSON string.
  String toJson() => json.encode(toMap());
}
