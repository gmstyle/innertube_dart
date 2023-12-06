import 'dart:convert';

class WebResponseContextExtensionData {
  bool? hasDecorated;

  WebResponseContextExtensionData({this.hasDecorated});

  factory WebResponseContextExtensionData.fromMap(Map<String, dynamic> data) {
    return WebResponseContextExtensionData(
      hasDecorated: data['hasDecorated'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'hasDecorated': hasDecorated,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WebResponseContextExtensionData].
  factory WebResponseContextExtensionData.fromJson(String data) {
    return WebResponseContextExtensionData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WebResponseContextExtensionData] to a JSON string.
  String toJson() => json.encode(toMap());
}
