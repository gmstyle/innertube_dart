import 'dart:convert';

import 'main_app_web_response_context.dart';
import 'service_tracking_param.dart';
import 'web_response_context_extension_data.dart';

class ResponseContext {
  String? visitorData;
  List<ServiceTrackingParam>? serviceTrackingParams;
  int? maxAgeSeconds;
  MainAppWebResponseContext? mainAppWebResponseContext;
  WebResponseContextExtensionData? webResponseContextExtensionData;

  ResponseContext({
    this.visitorData,
    this.serviceTrackingParams,
    this.maxAgeSeconds,
    this.mainAppWebResponseContext,
    this.webResponseContextExtensionData,
  });

  factory ResponseContext.fromMap(Map<String, dynamic> data) {
    return ResponseContext(
      visitorData: data['visitorData'] as String?,
      serviceTrackingParams: (data['serviceTrackingParams'] as List<dynamic>?)
          ?.map((e) => ServiceTrackingParam.fromMap(e as Map<String, dynamic>))
          .toList(),
      maxAgeSeconds: data['maxAgeSeconds'] as int?,
      mainAppWebResponseContext: data['mainAppWebResponseContext'] == null
          ? null
          : MainAppWebResponseContext.fromMap(
              data['mainAppWebResponseContext'] as Map<String, dynamic>),
      webResponseContextExtensionData:
          data['webResponseContextExtensionData'] == null
              ? null
              : WebResponseContextExtensionData.fromMap(
                  data['webResponseContextExtensionData']
                      as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'visitorData': visitorData,
        'serviceTrackingParams':
            serviceTrackingParams?.map((e) => e.toMap()).toList(),
        'maxAgeSeconds': maxAgeSeconds,
        'mainAppWebResponseContext': mainAppWebResponseContext?.toMap(),
        'webResponseContextExtensionData':
            webResponseContextExtensionData?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponseContext].
  factory ResponseContext.fromJson(String data) {
    return ResponseContext.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponseContext] to a JSON string.
  String toJson() => json.encode(toMap());
}
