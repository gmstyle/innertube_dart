// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestions_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestionsBody _$SearchSuggestionsBodyFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionsBody(
      context: json['context'] == null
          ? Context.defaultWeb
          : Context.fromJson(json['context'] as Map<String, dynamic>),
      input: json['input'] as String,
    );

Map<String, dynamic> _$SearchSuggestionsBodyToJson(
        SearchSuggestionsBody instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'input': instance.input,
    };
