import 'dart:convert';

class AdSlotLoggingData {
  String? serializedSlotAdServingDataEntry;

  AdSlotLoggingData({this.serializedSlotAdServingDataEntry});

  factory AdSlotLoggingData.fromMap(Map<String, dynamic> data) {
    return AdSlotLoggingData(
      serializedSlotAdServingDataEntry:
          data['serializedSlotAdServingDataEntry'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'serializedSlotAdServingDataEntry': serializedSlotAdServingDataEntry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdSlotLoggingData].
  factory AdSlotLoggingData.fromJson(String data) {
    return AdSlotLoggingData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdSlotLoggingData] to a JSON string.
  String toJson() => json.encode(toMap());
}
