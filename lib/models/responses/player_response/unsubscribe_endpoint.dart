import 'dart:convert';

class UnsubscribeEndpoint {
  List<dynamic>? channelIds;
  String? params;

  UnsubscribeEndpoint({this.channelIds, this.params});

  factory UnsubscribeEndpoint.fromMap(Map<String, dynamic> data) {
    return UnsubscribeEndpoint(
      channelIds: data['channelIds'] as List<dynamic>?,
      params: data['params'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'channelIds': channelIds,
        'params': params,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UnsubscribeEndpoint].
  factory UnsubscribeEndpoint.fromJson(String data) {
    return UnsubscribeEndpoint.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnsubscribeEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
