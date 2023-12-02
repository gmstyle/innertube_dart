import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'next_body.g.dart';

@JsonSerializable(explicitToJson: true)
class NextBody {
  final Context context;
  final String? videoId;
  final bool isAudioOnly;
  final String? playlistId;
  final String tunerSettingValue;
  final int? index;
  final String? params;
  final String? playlistSetVideoId;
  final WatchEndpointMusicSupportedConfigs watchEndpointMusicSupportedConfigs;

  NextBody({
    this.context = Context.defaultWeb,
    this.videoId,
    this.isAudioOnly = true,
    this.playlistId,
    this.tunerSettingValue = "AUTOMIX_SETTING_NORMAL",
    this.index,
    this.params,
    this.playlistSetVideoId,
    this.watchEndpointMusicSupportedConfigs =
        const WatchEndpointMusicSupportedConfigs(
            musicVideoType: "MUSIC_VIDEO_TYPE_ATV"),
  });

  factory NextBody.fromJson(Map<String, dynamic> json) =>
      _$NextBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NextBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WatchEndpointMusicSupportedConfigs {
  final String musicVideoType;

  const WatchEndpointMusicSupportedConfigs({required this.musicVideoType});

  factory WatchEndpointMusicSupportedConfigs.fromJson(
          Map<String, dynamic> json) =>
      _$WatchEndpointMusicSupportedConfigsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WatchEndpointMusicSupportedConfigsToJson(this);
}
