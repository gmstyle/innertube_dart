import 'dart:convert';

class BrowseEndpoint {
  String? browseId;

  BrowseEndpoint({this.browseId});

  factory BrowseEndpoint.fromMap(Map<String, dynamic> data) {
    return BrowseEndpoint(
      browseId: data['browseId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'browseId': browseId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BrowseEndpoint].
  factory BrowseEndpoint.fromJson(String data) {
    return BrowseEndpoint.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BrowseEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
