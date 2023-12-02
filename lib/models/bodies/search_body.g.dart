// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBody _$SearchBodyFromJson(Map<String, dynamic> json) => SearchBody(
      context: json['context'] == null
          ? Context.defaultWeb
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      query: json['query'] as String,
      params: json['params'] as String,
    );

Map<String, dynamic> _$SearchBodyToJson(SearchBody instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'query': instance.query,
      'params': instance.params,
    };
