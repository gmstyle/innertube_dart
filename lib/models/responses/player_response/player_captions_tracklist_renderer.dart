import 'dart:convert';

import 'audio_track.dart';
import 'caption_track.dart';
import 'translation_language.dart';

class PlayerCaptionsTracklistRenderer {
  List<CaptionTrack>? captionTracks;
  List<AudioTrack>? audioTracks;
  List<TranslationLanguage>? translationLanguages;
  int? defaultAudioTrackIndex;

  PlayerCaptionsTracklistRenderer({
    this.captionTracks,
    this.audioTracks,
    this.translationLanguages,
    this.defaultAudioTrackIndex,
  });

  factory PlayerCaptionsTracklistRenderer.fromMap(Map<String, dynamic> data) {
    return PlayerCaptionsTracklistRenderer(
      captionTracks: (data['captionTracks'] as List<dynamic>?)
          ?.map((e) => CaptionTrack.fromMap(e as Map<String, dynamic>))
          .toList(),
      audioTracks: (data['audioTracks'] as List<dynamic>?)
          ?.map((e) => AudioTrack.fromMap(e as Map<String, dynamic>))
          .toList(),
      translationLanguages: (data['translationLanguages'] as List<dynamic>?)
          ?.map((e) => TranslationLanguage.fromMap(e as Map<String, dynamic>))
          .toList(),
      defaultAudioTrackIndex: data['defaultAudioTrackIndex'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'captionTracks': captionTracks?.map((e) => e.toMap()).toList(),
        'audioTracks': audioTracks?.map((e) => e.toMap()).toList(),
        'translationLanguages':
            translationLanguages?.map((e) => e.toMap()).toList(),
        'defaultAudioTrackIndex': defaultAudioTrackIndex,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerCaptionsTracklistRenderer].
  factory PlayerCaptionsTracklistRenderer.fromJson(String data) {
    return PlayerCaptionsTracklistRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerCaptionsTracklistRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
