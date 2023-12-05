// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      baseUrl: json['baseUrl'] as String,
      clients: (json['clients'] as List<dynamic>)
          .map((e) => ClientContext.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'clients': instance.clients.map((e) => e.toJson()).toList(),
    };
