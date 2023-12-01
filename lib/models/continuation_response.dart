import 'package:innertube_dart/models/music_shelf_renderer.dart';
import 'package:innertube_dart/models/next_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'continuation_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ContinuationResponse {
  final ContinuationContents? continuationContents;

  ContinuationResponse({
    this.continuationContents,
  });

  factory ContinuationResponse.fromJson(Map<String, dynamic> json) {
    return _$ContinuationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContinuationResponseToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class ContinuationContents {
  final MusicShelfRenderer? musicShelfContinuation;
  final PlaylistPanelRenderer? playlistPanelContinuation;

  ContinuationContents({
    this.musicShelfContinuation,
    this.playlistPanelContinuation,
  });

  factory ContinuationContents.fromJson(Map<String, dynamic> json) {
    json['musicShelfContinuation'] ??= json['musicPlaylistShelfContinuation'];
    return _$ContinuationContentsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContinuationContentsToJson(this);
  }
}
