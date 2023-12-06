import 'dart:convert';

import 'abandon_ping.dart';
import 'active_view_fully_viewable_audible_half_duration_ping.dart';
import 'active_view_measurable_ping.dart';
import 'active_view_tracking.dart';
import 'active_view_viewable_ping.dart';
import 'close_ping.dart';
import 'complete_ping.dart';
import 'end_fullscreen_ping.dart';
import 'error_ping.dart';
import 'fullscreen_ping.dart';
import 'impression_ping.dart';
import 'mute_ping.dart';
import 'pause_ping.dart';
import 'resume_ping.dart';
import 'rewind_ping.dart';
import 'unmute_ping.dart';

class Pings {
  List<ImpressionPing>? impressionPings;
  List<ErrorPing>? errorPings;
  List<MutePing>? mutePings;
  List<UnmutePing>? unmutePings;
  List<PausePing>? pausePings;
  List<RewindPing>? rewindPings;
  List<ResumePing>? resumePings;
  List<ClosePing>? closePings;
  List<FullscreenPing>? fullscreenPings;
  List<ActiveViewViewablePing>? activeViewViewablePings;
  List<EndFullscreenPing>? endFullscreenPings;
  List<ActiveViewMeasurablePing>? activeViewMeasurablePings;
  List<AbandonPing>? abandonPings;
  List<ActiveViewFullyViewableAudibleHalfDurationPing>?
      activeViewFullyViewableAudibleHalfDurationPings;
  List<CompletePing>? completePings;
  ActiveViewTracking? activeViewTracking;

  Pings({
    this.impressionPings,
    this.errorPings,
    this.mutePings,
    this.unmutePings,
    this.pausePings,
    this.rewindPings,
    this.resumePings,
    this.closePings,
    this.fullscreenPings,
    this.activeViewViewablePings,
    this.endFullscreenPings,
    this.activeViewMeasurablePings,
    this.abandonPings,
    this.activeViewFullyViewableAudibleHalfDurationPings,
    this.completePings,
    this.activeViewTracking,
  });

  factory Pings.fromMap(Map<String, dynamic> data) => Pings(
        impressionPings: (data['impressionPings'] as List<dynamic>?)
            ?.map((e) => ImpressionPing.fromMap(e as Map<String, dynamic>))
            .toList(),
        errorPings: (data['errorPings'] as List<dynamic>?)
            ?.map((e) => ErrorPing.fromMap(e as Map<String, dynamic>))
            .toList(),
        mutePings: (data['mutePings'] as List<dynamic>?)
            ?.map((e) => MutePing.fromMap(e as Map<String, dynamic>))
            .toList(),
        unmutePings: (data['unmutePings'] as List<dynamic>?)
            ?.map((e) => UnmutePing.fromMap(e as Map<String, dynamic>))
            .toList(),
        pausePings: (data['pausePings'] as List<dynamic>?)
            ?.map((e) => PausePing.fromMap(e as Map<String, dynamic>))
            .toList(),
        rewindPings: (data['rewindPings'] as List<dynamic>?)
            ?.map((e) => RewindPing.fromMap(e as Map<String, dynamic>))
            .toList(),
        resumePings: (data['resumePings'] as List<dynamic>?)
            ?.map((e) => ResumePing.fromMap(e as Map<String, dynamic>))
            .toList(),
        closePings: (data['closePings'] as List<dynamic>?)
            ?.map((e) => ClosePing.fromMap(e as Map<String, dynamic>))
            .toList(),
        fullscreenPings: (data['fullscreenPings'] as List<dynamic>?)
            ?.map((e) => FullscreenPing.fromMap(e as Map<String, dynamic>))
            .toList(),
        activeViewViewablePings:
            (data['activeViewViewablePings'] as List<dynamic>?)
                ?.map((e) =>
                    ActiveViewViewablePing.fromMap(e as Map<String, dynamic>))
                .toList(),
        endFullscreenPings: (data['endFullscreenPings'] as List<dynamic>?)
            ?.map((e) => EndFullscreenPing.fromMap(e as Map<String, dynamic>))
            .toList(),
        activeViewMeasurablePings:
            (data['activeViewMeasurablePings'] as List<dynamic>?)
                ?.map((e) =>
                    ActiveViewMeasurablePing.fromMap(e as Map<String, dynamic>))
                .toList(),
        abandonPings: (data['abandonPings'] as List<dynamic>?)
            ?.map((e) => AbandonPing.fromMap(e as Map<String, dynamic>))
            .toList(),
        activeViewFullyViewableAudibleHalfDurationPings:
            (data['activeViewFullyViewableAudibleHalfDurationPings']
                    as List<dynamic>?)
                ?.map((e) =>
                    ActiveViewFullyViewableAudibleHalfDurationPing.fromMap(
                        e as Map<String, dynamic>))
                .toList(),
        completePings: (data['completePings'] as List<dynamic>?)
            ?.map((e) => CompletePing.fromMap(e as Map<String, dynamic>))
            .toList(),
        activeViewTracking: data['activeViewTracking'] == null
            ? null
            : ActiveViewTracking.fromMap(
                data['activeViewTracking'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'impressionPings': impressionPings?.map((e) => e.toMap()).toList(),
        'errorPings': errorPings?.map((e) => e.toMap()).toList(),
        'mutePings': mutePings?.map((e) => e.toMap()).toList(),
        'unmutePings': unmutePings?.map((e) => e.toMap()).toList(),
        'pausePings': pausePings?.map((e) => e.toMap()).toList(),
        'rewindPings': rewindPings?.map((e) => e.toMap()).toList(),
        'resumePings': resumePings?.map((e) => e.toMap()).toList(),
        'closePings': closePings?.map((e) => e.toMap()).toList(),
        'fullscreenPings': fullscreenPings?.map((e) => e.toMap()).toList(),
        'activeViewViewablePings':
            activeViewViewablePings?.map((e) => e.toMap()).toList(),
        'endFullscreenPings':
            endFullscreenPings?.map((e) => e.toMap()).toList(),
        'activeViewMeasurablePings':
            activeViewMeasurablePings?.map((e) => e.toMap()).toList(),
        'abandonPings': abandonPings?.map((e) => e.toMap()).toList(),
        'activeViewFullyViewableAudibleHalfDurationPings':
            activeViewFullyViewableAudibleHalfDurationPings
                ?.map((e) => e.toMap())
                .toList(),
        'completePings': completePings?.map((e) => e.toMap()).toList(),
        'activeViewTracking': activeViewTracking?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pings].
  factory Pings.fromJson(String data) {
    return Pings.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pings] to a JSON string.
  String toJson() => json.encode(toMap());
}
