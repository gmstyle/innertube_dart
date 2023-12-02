// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowseContext _$BrowseContextFromJson(Map<String, dynamic> json) =>
    BrowseContext(
      context: json['context'] == null
          ? null
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      browseId: json['browseId'] as String,
      params: json['params'] as String?,
    );

Map<String, dynamic> _$BrowseContextToJson(BrowseContext instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'browseId': instance.browseId,
      'params': instance.params,
    };
