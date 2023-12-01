// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continuation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContinuationResponse _$ContinuationResponseFromJson(
        Map<String, dynamic> json) =>
    ContinuationResponse(
      continuationContents: json['continuationContents'] == null
          ? null
          : ContinuationContents.fromJson(
              json['continuationContents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContinuationResponseToJson(
        ContinuationResponse instance) =>
    <String, dynamic>{
      'continuationContents': instance.continuationContents?.toJson(),
    };

ContinuationContents _$ContinuationContentsFromJson(
        Map<String, dynamic> json) =>
    ContinuationContents(
      musicShelfContinuation: json['musicShelfContinuation'] == null
          ? null
          : MusicShelfRenderer.fromJson(
              json['musicShelfContinuation'] as Map<String, dynamic>),
      playlistPanelContinuation: json['playlistPanelContinuation'] == null
          ? null
          : PlaylistPanelRenderer.fromJson(
              json['playlistPanelContinuation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContinuationContentsToJson(
        ContinuationContents instance) =>
    <String, dynamic>{
      'musicShelfContinuation': instance.musicShelfContinuation?.toJson(),
      'playlistPanelContinuation': instance.playlistPanelContinuation?.toJson(),
    };
