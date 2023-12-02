// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continuation_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContinuationBody _$ContinuationBodyFromJson(Map<String, dynamic> json) =>
    ContinuationBody(
      context: json['context'] == null
          ? null
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      continuation: json['continuation'] as String,
    );

Map<String, dynamic> _$ContinuationBodyToJson(ContinuationBody instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'continuation': instance.continuation,
    };
