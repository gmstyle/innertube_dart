import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_body.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerBody {
  final Context context;
  final String videoId;
  final String? playlistId;

  PlayerBody({
    this.context = Context.defaultAndroid,
    required this.videoId,
    this.playlistId,
  });

  factory PlayerBody.fromJson(Map<String, dynamic> json) =>
      _$PlayerBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerBodyToJson(this);
}
