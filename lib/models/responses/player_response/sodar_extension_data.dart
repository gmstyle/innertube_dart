import 'dart:convert';

class SodarExtensionData {
  String? siub;
  String? bgub;
  String? scs;
  String? bgp;

  SodarExtensionData({this.siub, this.bgub, this.scs, this.bgp});

  factory SodarExtensionData.fromMap(Map<String, dynamic> data) {
    return SodarExtensionData(
      siub: data['siub'] as String?,
      bgub: data['bgub'] as String?,
      scs: data['scs'] as String?,
      bgp: data['bgp'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'siub': siub,
        'bgub': bgub,
        'scs': scs,
        'bgp': bgp,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SodarExtensionData].
  factory SodarExtensionData.fromJson(String data) {
    return SodarExtensionData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SodarExtensionData] to a JSON string.
  String toJson() => json.encode(toMap());
}
