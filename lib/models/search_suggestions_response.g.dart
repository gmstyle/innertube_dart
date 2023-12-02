// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestionsResponse _$SearchSuggestionsResponseFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionsResponse(
      contents: json['contents'] == null
          ? null
          : SearchSuggestionsResponseContent.fromJson(
              json['contents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchSuggestionsResponseToJson(
        SearchSuggestionsResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents?.toJson(),
    };

SearchSuggestionsResponseContent _$SearchSuggestionsResponseContentFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionsResponseContent(
      searchSuggestionsSectionRenderer:
          json['searchSuggestionsSectionRenderer'] == null
              ? null
              : SearchSuggestionsSectionRenderer.fromJson(
                  json['searchSuggestionsSectionRenderer']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchSuggestionsResponseContentToJson(
        SearchSuggestionsResponseContent instance) =>
    <String, dynamic>{
      'searchSuggestionsSectionRenderer':
          instance.searchSuggestionsSectionRenderer?.toJson(),
    };

SearchSuggestionsSectionRenderer _$SearchSuggestionsSectionRendererFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionsSectionRenderer(
      contents: (json['contents'] as List<dynamic>)
          .map((e) => SearchSuggestionsSectionRendererContent.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchSuggestionsSectionRendererToJson(
        SearchSuggestionsSectionRenderer instance) =>
    <String, dynamic>{
      'contents': instance.contents.map((e) => e.toJson()).toList(),
    };

SearchSuggestionsSectionRendererContent
    _$SearchSuggestionsSectionRendererContentFromJson(
            Map<String, dynamic> json) =>
        SearchSuggestionsSectionRendererContent(
          searchSuggestionRenderer: json['searchSuggestionRenderer'] == null
              ? null
              : SearchSuggestionRenderer.fromJson(
                  json['searchSuggestionRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SearchSuggestionsSectionRendererContentToJson(
        SearchSuggestionsSectionRendererContent instance) =>
    <String, dynamic>{
      'searchSuggestionRenderer': instance.searchSuggestionRenderer?.toJson(),
    };

SearchSuggestionRenderer _$SearchSuggestionRendererFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionRenderer(
      navigationEndpoint: json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchSuggestionRendererToJson(
        SearchSuggestionRenderer instance) =>
    <String, dynamic>{
      'navigationEndpoint': instance.navigationEndpoint?.toJson(),
    };
