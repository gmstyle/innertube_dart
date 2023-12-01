import 'package:innertube_dart/models/music_two_row_item_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grid_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class GridRenderer {
  final List<Item>? items;

  GridRenderer({this.items});

  factory GridRenderer.fromJson(Map<String, dynamic> json) {
    return _$GridRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GridRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Item {
  final MusicTwoRowItemRenderer? musicTwoRowItemRenderer;

  Item({this.musicTwoRowItemRenderer});

  factory Item.fromJson(Map<String, dynamic> json) {
    return _$ItemFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemToJson(this);
  }
}
