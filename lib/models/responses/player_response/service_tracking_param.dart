import 'dart:convert';

import 'param.dart';

class ServiceTrackingParam {
  String? service;
  List<Param>? params;

  ServiceTrackingParam({this.service, this.params});

  factory ServiceTrackingParam.fromMap(Map<String, dynamic> data) {
    return ServiceTrackingParam(
      service: data['service'] as String?,
      params: (data['params'] as List<dynamic>?)
          ?.map((e) => Param.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'service': service,
        'params': params?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceTrackingParam].
  factory ServiceTrackingParam.fromJson(String data) {
    return ServiceTrackingParam.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceTrackingParam] to a JSON string.
  String toJson() => json.encode(toMap());
}
