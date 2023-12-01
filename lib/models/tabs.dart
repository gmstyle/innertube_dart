import 'package:innertube_dart/models/section_list_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tabs.g.dart';

@JsonSerializable(explicitToJson: true)
class Tabs {
  final List<Tab>? tabs;

  Tabs({
    this.tabs,
  });

  factory Tabs.fromJson(Map<String, dynamic> json) {
    return _$TabsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TabsToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Tab {
  final TabRenderer? tabRenderer;

  Tab({
    this.tabRenderer,
  });

  factory Tab.fromJson(Map<String, dynamic> json) {
    return _$TabFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TabToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class TabRenderer {
  final Content? content;
  final String? title;
  final String? tabIdentifier;

  TabRenderer({
    this.content,
    this.title,
    this.tabIdentifier,
  });

  factory TabRenderer.fromJson(Map<String, dynamic> json) {
    return _$TabRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TabRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Content {
  final SectionListRenderer? sectionListRenderer;

  Content({
    this.sectionListRenderer,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContentToJson(this);
  }
}
