// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseContext _$ResponseContextFromJson(Map<String, dynamic> json) =>
    ResponseContext(
      function: json['function'] as String?,
      browseId: json['browseId'] as String?,
      context: json['context'] as String?,
      visitorData: json['visitorData'] as String?,
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      request: Request.fromJson(json['request'] as Map<String, dynamic>),
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseContextToJson(ResponseContext instance) =>
    <String, dynamic>{
      'function': instance.function,
      'browseId': instance.browseId,
      'context': instance.context,
      'visitorData': instance.visitorData,
      'client': instance.client.toJson(),
      'request': instance.request.toJson(),
      'flags': instance.flags.toJson(),
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      type: json['type'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      name: json['name'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
    };

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
      isLoggedin: json['isLoggedin'] as bool?,
    );

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
      'isLoggedin': instance.isLoggedin,
    };

ResponseFingerprint _$ResponseFingerprintFromJson(Map<String, dynamic> json) =>
    ResponseFingerprint(
      request: json['request'] as String?,
      function: json['function'] as String?,
      browseId: json['browseId'] as String?,
      context: json['context'] as String?,
      client: json['client'] as String?,
    );

Map<String, dynamic> _$ResponseFingerprintToJson(
        ResponseFingerprint instance) =>
    <String, dynamic>{
      'request': instance.request,
      'function': instance.function,
      'browseId': instance.browseId,
      'context': instance.context,
      'client': instance.client,
    };
