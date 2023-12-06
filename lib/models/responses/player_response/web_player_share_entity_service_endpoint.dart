import 'dart:convert';

class WebPlayerShareEntityServiceEndpoint {
  String? serializedShareEntity;

  WebPlayerShareEntityServiceEndpoint({this.serializedShareEntity});

  factory WebPlayerShareEntityServiceEndpoint.fromMap(
      Map<String, dynamic> data) {
    return WebPlayerShareEntityServiceEndpoint(
      serializedShareEntity: data['serializedShareEntity'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'serializedShareEntity': serializedShareEntity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WebPlayerShareEntityServiceEndpoint].
  factory WebPlayerShareEntityServiceEndpoint.fromJson(String data) {
    return WebPlayerShareEntityServiceEndpoint.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WebPlayerShareEntityServiceEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
