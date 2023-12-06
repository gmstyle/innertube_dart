import 'dart:convert';

class SubscribeEndpoint {
  List<dynamic>? channelIds;
  String? params;

  SubscribeEndpoint({this.channelIds, this.params});

  factory SubscribeEndpoint.fromMap(Map<String, dynamic> data) {
    return SubscribeEndpoint(
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
  /// Parses the string and returns the resulting Json object as [SubscribeEndpoint].
  factory SubscribeEndpoint.fromJson(String data) {
    return SubscribeEndpoint.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscribeEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
