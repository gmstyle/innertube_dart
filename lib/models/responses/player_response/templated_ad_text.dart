import 'dart:convert';

class TemplatedAdText {
  String? text;
  bool? isTemplated;
  String? trackingParams;

  TemplatedAdText({this.text, this.isTemplated, this.trackingParams});

  factory TemplatedAdText.fromMap(Map<String, dynamic> data) {
    return TemplatedAdText(
      text: data['text'] as String?,
      isTemplated: data['isTemplated'] as bool?,
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'text': text,
        'isTemplated': isTemplated,
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TemplatedAdText].
  factory TemplatedAdText.fromJson(String data) {
    return TemplatedAdText.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TemplatedAdText] to a JSON string.
  String toJson() => json.encode(toMap());
}
