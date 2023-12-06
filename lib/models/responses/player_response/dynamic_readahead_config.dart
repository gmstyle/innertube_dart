import 'dart:convert';

class DynamicReadaheadConfig {
  int? maxReadAheadMediaTimeMs;
  int? minReadAheadMediaTimeMs;
  int? readAheadGrowthRateMs;

  DynamicReadaheadConfig({
    this.maxReadAheadMediaTimeMs,
    this.minReadAheadMediaTimeMs,
    this.readAheadGrowthRateMs,
  });

  factory DynamicReadaheadConfig.fromMap(Map<String, dynamic> data) {
    return DynamicReadaheadConfig(
      maxReadAheadMediaTimeMs: data['maxReadAheadMediaTimeMs'] as int?,
      minReadAheadMediaTimeMs: data['minReadAheadMediaTimeMs'] as int?,
      readAheadGrowthRateMs: data['readAheadGrowthRateMs'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'maxReadAheadMediaTimeMs': maxReadAheadMediaTimeMs,
        'minReadAheadMediaTimeMs': minReadAheadMediaTimeMs,
        'readAheadGrowthRateMs': readAheadGrowthRateMs,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DynamicReadaheadConfig].
  factory DynamicReadaheadConfig.fromJson(String data) {
    return DynamicReadaheadConfig.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DynamicReadaheadConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
