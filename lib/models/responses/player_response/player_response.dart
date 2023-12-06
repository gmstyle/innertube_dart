import 'dart:convert';

import 'ad_placement.dart';
import 'annotation.dart';
import 'attestation.dart';
import 'captions.dart';
import 'cards.dart';
import 'framework_updates.dart';
import 'microformat.dart';
import 'playability_status.dart';
import 'playback_tracking.dart';
import 'player_ad.dart';
import 'player_config.dart';
import 'response_context.dart';
import 'storyboards.dart';
import 'streaming_data.dart';
import 'video_details.dart';

class PlayerResponse {
  ResponseContext? responseContext;
  PlayabilityStatus? playabilityStatus;
  StreamingData? streamingData;
  List<PlayerAd>? playerAds;
  PlaybackTracking? playbackTracking;
  Captions? captions;
  VideoDetails? videoDetails;
  List<Annotation>? annotations;
  PlayerConfig? playerConfig;
  Storyboards? storyboards;
  Microformat? microformat;
  Cards? cards;
  String? trackingParams;
  Attestation? attestation;
  List<AdPlacement>? adPlacements;
  String? adBreakHeartbeatParams;
  FrameworkUpdates? frameworkUpdates;

  PlayerResponse({
    this.responseContext,
    this.playabilityStatus,
    this.streamingData,
    this.playerAds,
    this.playbackTracking,
    this.captions,
    this.videoDetails,
    this.annotations,
    this.playerConfig,
    this.storyboards,
    this.microformat,
    this.cards,
    this.trackingParams,
    this.attestation,
    this.adPlacements,
    this.adBreakHeartbeatParams,
    this.frameworkUpdates,
  });

  factory PlayerResponse.fromMap(Map<String, dynamic> data) {
    return PlayerResponse(
      responseContext: data['responseContext'] == null
          ? null
          : ResponseContext.fromMap(
              data['responseContext'] as Map<String, dynamic>),
      playabilityStatus: data['playabilityStatus'] == null
          ? null
          : PlayabilityStatus.fromMap(
              data['playabilityStatus'] as Map<String, dynamic>),
      streamingData: data['streamingData'] == null
          ? null
          : StreamingData.fromMap(
              data['streamingData'] as Map<String, dynamic>),
      playerAds: (data['playerAds'] as List<dynamic>?)
          ?.map((e) => PlayerAd.fromMap(e as Map<String, dynamic>))
          .toList(),
      playbackTracking: data['playbackTracking'] == null
          ? null
          : PlaybackTracking.fromMap(
              data['playbackTracking'] as Map<String, dynamic>),
      captions: data['captions'] == null
          ? null
          : Captions.fromMap(data['captions'] as Map<String, dynamic>),
      videoDetails: data['videoDetails'] == null
          ? null
          : VideoDetails.fromMap(data['videoDetails'] as Map<String, dynamic>),
      annotations: (data['annotations'] as List<dynamic>?)
          ?.map((e) => Annotation.fromMap(e as Map<String, dynamic>))
          .toList(),
      playerConfig: data['playerConfig'] == null
          ? null
          : PlayerConfig.fromMap(data['playerConfig'] as Map<String, dynamic>),
      storyboards: data['storyboards'] == null
          ? null
          : Storyboards.fromMap(data['storyboards'] as Map<String, dynamic>),
      microformat: data['microformat'] == null
          ? null
          : Microformat.fromMap(data['microformat'] as Map<String, dynamic>),
      cards: data['cards'] == null
          ? null
          : Cards.fromMap(data['cards'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
      attestation: data['attestation'] == null
          ? null
          : Attestation.fromMap(data['attestation'] as Map<String, dynamic>),
      adPlacements: (data['adPlacements'] as List<dynamic>?)
          ?.map((e) => AdPlacement.fromMap(e as Map<String, dynamic>))
          .toList(),
      adBreakHeartbeatParams: data['adBreakHeartbeatParams'] as String?,
      frameworkUpdates: data['frameworkUpdates'] == null
          ? null
          : FrameworkUpdates.fromMap(
              data['frameworkUpdates'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'responseContext': responseContext?.toMap(),
        'playabilityStatus': playabilityStatus?.toMap(),
        'streamingData': streamingData?.toMap(),
        'playerAds': playerAds?.map((e) => e.toMap()).toList(),
        'playbackTracking': playbackTracking?.toMap(),
        'captions': captions?.toMap(),
        'videoDetails': videoDetails?.toMap(),
        'annotations': annotations?.map((e) => e.toMap()).toList(),
        'playerConfig': playerConfig?.toMap(),
        'storyboards': storyboards?.toMap(),
        'microformat': microformat?.toMap(),
        'cards': cards?.toMap(),
        'trackingParams': trackingParams,
        'attestation': attestation?.toMap(),
        'adPlacements': adPlacements?.map((e) => e.toMap()).toList(),
        'adBreakHeartbeatParams': adBreakHeartbeatParams,
        'frameworkUpdates': frameworkUpdates?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerResponse].
  factory PlayerResponse.fromJson(String data) {
    return PlayerResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
