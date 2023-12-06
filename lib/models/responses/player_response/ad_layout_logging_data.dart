import 'dart:convert';

class AdLayoutLoggingData {
  String? serializedAdServingDataEntry;

  AdLayoutLoggingData({this.serializedAdServingDataEntry});

  factory AdLayoutLoggingData.fromMap(Map<String, dynamic> data) {
    return AdLayoutLoggingData(
      serializedAdServingDataEntry:
          data['serializedAdServingDataEntry'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'serializedAdServingDataEntry': serializedAdServingDataEntry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdLayoutLoggingData].
  factory AdLayoutLoggingData.fromJson(String data) {
    return AdLayoutLoggingData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdLayoutLoggingData] to a JSON string.
  String toJson() => json.encode(toMap());
}
