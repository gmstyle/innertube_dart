import 'dart:convert';

class ColorInfo {
  String? primaries;
  String? transferCharacteristics;
  String? matrixCoefficients;

  ColorInfo({
    this.primaries,
    this.transferCharacteristics,
    this.matrixCoefficients,
  });

  factory ColorInfo.fromMap(Map<String, dynamic> data) => ColorInfo(
        primaries: data['primaries'] as String?,
        transferCharacteristics: data['transferCharacteristics'] as String?,
        matrixCoefficients: data['matrixCoefficients'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'primaries': primaries,
        'transferCharacteristics': transferCharacteristics,
        'matrixCoefficients': matrixCoefficients,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ColorInfo].
  factory ColorInfo.fromJson(String data) {
    return ColorInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ColorInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
