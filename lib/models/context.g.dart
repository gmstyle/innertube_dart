// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      thirdParty: json['thirdParty'] == null
          ? null
          : ThirdParty.fromJson(json['thirdParty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'client': instance.client,
      'thirdParty': instance.thirdParty,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      clientName: json['clientName'] as String,
      clientVersion: json['clientVersion'] as String,
      platform: json['platform'] as String,
      androidSdkVersion: json['androidSdkVersion'] as int?,
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'clientName': instance.clientName,
      'clientVersion': instance.clientVersion,
      'platform': instance.platform,
      'androidSdkVersion': instance.androidSdkVersion,
      'userAgent': instance.userAgent,
    };

ThirdParty _$ThirdPartyFromJson(Map<String, dynamic> json) => ThirdParty(
      embedUrl: json['embedUrl'] as String?,
    );

Map<String, dynamic> _$ThirdPartyToJson(ThirdParty instance) =>
    <String, dynamic>{
      'embedUrl': instance.embedUrl,
    };
