import 'dart:convert';

class Message {
  String? simpleText;

  Message({this.simpleText});

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        simpleText: data['simpleText'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'simpleText': simpleText,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());
}
