// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Runs _$RunsFromJson(Map<String, dynamic> json) => Runs(
      runs: (json['runs'] as List<dynamic>)
          .map((e) => Run.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RunsToJson(Runs instance) => <String, dynamic>{
      'runs': instance.runs,
    };

Run _$RunFromJson(Map<String, dynamic> json) => Run(
      text: json['text'] as String?,
      navigationEndpoint: json['navigationEndpoint'] as String?,
    );

Map<String, dynamic> _$RunToJson(Run instance) => <String, dynamic>{
      'text': instance.text,
      'navigationEndpoint': instance.navigationEndpoint,
    };
