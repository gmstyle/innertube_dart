import 'dart:convert';

import 'atr_url.dart';
import 'ptracking_url.dart';
import 'qoe_url.dart';
import 'videostats_delayplay_url.dart';
import 'videostats_playback_url.dart';
import 'videostats_watchtime_url.dart';

class PlaybackTracking {
  VideostatsPlaybackUrl? videostatsPlaybackUrl;
  VideostatsDelayplayUrl? videostatsDelayplayUrl;
  VideostatsWatchtimeUrl? videostatsWatchtimeUrl;
  PtrackingUrl? ptrackingUrl;
  QoeUrl? qoeUrl;
  AtrUrl? atrUrl;
  List<dynamic>? videostatsScheduledFlushWalltimeSeconds;
  int? videostatsDefaultFlushIntervalSeconds;

  PlaybackTracking({
    this.videostatsPlaybackUrl,
    this.videostatsDelayplayUrl,
    this.videostatsWatchtimeUrl,
    this.ptrackingUrl,
    this.qoeUrl,
    this.atrUrl,
    this.videostatsScheduledFlushWalltimeSeconds,
    this.videostatsDefaultFlushIntervalSeconds,
  });

  factory PlaybackTracking.fromMap(Map<String, dynamic> data) {
    return PlaybackTracking(
      videostatsPlaybackUrl: data['videostatsPlaybackUrl'] == null
          ? null
          : VideostatsPlaybackUrl.fromMap(
              data['videostatsPlaybackUrl'] as Map<String, dynamic>),
      videostatsDelayplayUrl: data['videostatsDelayplayUrl'] == null
          ? null
          : VideostatsDelayplayUrl.fromMap(
              data['videostatsDelayplayUrl'] as Map<String, dynamic>),
      videostatsWatchtimeUrl: data['videostatsWatchtimeUrl'] == null
          ? null
          : VideostatsWatchtimeUrl.fromMap(
              data['videostatsWatchtimeUrl'] as Map<String, dynamic>),
      ptrackingUrl: data['ptrackingUrl'] == null
          ? null
          : PtrackingUrl.fromMap(data['ptrackingUrl'] as Map<String, dynamic>),
      qoeUrl: data['qoeUrl'] == null
          ? null
          : QoeUrl.fromMap(data['qoeUrl'] as Map<String, dynamic>),
      atrUrl: data['atrUrl'] == null
          ? null
          : AtrUrl.fromMap(data['atrUrl'] as Map<String, dynamic>),
      videostatsScheduledFlushWalltimeSeconds:
          data['videostatsScheduledFlushWalltimeSeconds'] as List<dynamic>?,
      videostatsDefaultFlushIntervalSeconds:
          data['videostatsDefaultFlushIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'videostatsPlaybackUrl': videostatsPlaybackUrl?.toMap(),
        'videostatsDelayplayUrl': videostatsDelayplayUrl?.toMap(),
        'videostatsWatchtimeUrl': videostatsWatchtimeUrl?.toMap(),
        'ptrackingUrl': ptrackingUrl?.toMap(),
        'qoeUrl': qoeUrl?.toMap(),
        'atrUrl': atrUrl?.toMap(),
        'videostatsScheduledFlushWalltimeSeconds':
            videostatsScheduledFlushWalltimeSeconds,
        'videostatsDefaultFlushIntervalSeconds':
            videostatsDefaultFlushIntervalSeconds,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlaybackTracking].
  factory PlaybackTracking.fromJson(String data) {
    return PlaybackTracking.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlaybackTracking] to a JSON string.
  String toJson() => json.encode(toMap());
}
