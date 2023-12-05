// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientContext _$ClientContextFromJson(Map<String, dynamic> json) =>
    ClientContext(
      clientName: json['clientName'] as String,
      clientVersion: json['clientVersion'] as String,
      clientId: json['clientId'] as int?,
      apiKey: json['apiKey'] as String?,
      userAgent: json['userAgent'] as String?,
      referer: json['referer'] as String?,
      locale: json['locale'] == null
          ? null
          : Locale.fromJson(json['locale'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientContextToJson(ClientContext instance) =>
    <String, dynamic>{
      'clientName': instance.clientName,
      'clientVersion': instance.clientVersion,
      'clientId': instance.clientId,
      'apiKey': instance.apiKey,
      'userAgent': instance.userAgent,
      'referer': instance.referer,
      'locale': instance.locale?.toJson(),
    };
