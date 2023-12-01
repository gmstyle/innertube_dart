import 'package:innertube_dart/models/button_renderer.dart';
import 'package:innertube_dart/models/section_list_renderer.dart';
import 'package:innertube_dart/models/tabs.dart';
import 'package:innertube_dart/models/thumbnail_renderer.dart';

import 'runs.dart';

class BrowseResponse {
  final Contents? contents;
  final Header? header;
  final Microformat? microformat;

  BrowseResponse({
    this.contents,
    this.header,
    this.microformat,
  });

  factory BrowseResponse.fromJson(Map<String, dynamic> json) {
    return BrowseResponse(
      contents:
          json['contents'] != null ? Contents.fromJson(json['contents']) : null,
      header: json['header'] != null ? Header.fromJson(json['header']) : null,
      microformat: json['microformat'] != null
          ? Microformat.fromJson(json['microformat'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contents': contents?.toJson(),
      'header': header?.toJson(),
      'microformat': microformat?.toJson(),
    };
  }
}

class Contents {
  final Tabs? singleColumnBrowseResultsRenderer;
  final SectionListRenderer? sectionListRenderer;

  Contents({this.singleColumnBrowseResultsRenderer, this.sectionListRenderer});

  factory Contents.fromJson(Map<String, dynamic> json) {
    return Contents(
      singleColumnBrowseResultsRenderer:
          json['singleColumnBrowseResultsRenderer'] != null
              ? Tabs.fromJson(json['singleColumnBrowseResultsRenderer'])
              : null,
      sectionListRenderer: json['sectionListRenderer'] != null
          ? SectionListRenderer.fromJson(json['sectionListRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'singleColumnBrowseResultsRenderer':
          singleColumnBrowseResultsRenderer?.toJson(),
      'sectionListRenderer': sectionListRenderer?.toJson(),
    };
  }
}

class Header {
  final MusicImmersiveHeaderRenderer? musicImmersiveHeaderRenderer;
  final MusicDetailHeaderRenderer? musicDetailHeaderRenderer;

  Header({this.musicImmersiveHeaderRenderer, this.musicDetailHeaderRenderer});

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      musicImmersiveHeaderRenderer: json['musicImmersiveHeaderRenderer'] != null
          ? MusicImmersiveHeaderRenderer.fromJson(
              json['musicImmersiveHeaderRenderer'])
          : null,
      musicDetailHeaderRenderer: json['musicDetailHeaderRenderer'] != null
          ? MusicDetailHeaderRenderer.fromJson(
              json['musicDetailHeaderRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'musicImmersiveHeaderRenderer': musicImmersiveHeaderRenderer?.toJson(),
      'musicDetailHeaderRenderer': musicDetailHeaderRenderer?.toJson(),
    };
  }
}

class MusicDetailHeaderRenderer {
  final Runs? title;
  final Runs? subtitle;
  final Runs? secondSubtitle;
  final ThumbnailRenderer? thumbnail;

  MusicDetailHeaderRenderer(
      {this.title, this.subtitle, this.secondSubtitle, this.thumbnail});

  factory MusicDetailHeaderRenderer.fromJson(Map<String, dynamic> json) {
    return MusicDetailHeaderRenderer(
      title: json['title'] != null ? Runs.fromJson(json['title']) : null,
      subtitle:
          json['subtitle'] != null ? Runs.fromJson(json['subtitle']) : null,
      secondSubtitle: json['secondSubtitle'] != null
          ? Runs.fromJson(json['secondSubtitle'])
          : null,
      thumbnail: json['thumbnail'] != null
          ? ThumbnailRenderer.fromJson(json['thumbnail'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (subtitle != null) {
      data['subtitle'] = subtitle!.toJson();
    }
    if (secondSubtitle != null) {
      data['secondSubtitle'] = secondSubtitle!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class MusicImmersiveHeaderRenderer {
  final Runs? description;
  final PlayButton? playButton;
  final StartRadioButton? startRadioButton;
  final ThumbnailRenderer? thumbnail;
  final ThumbnailRenderer? foregroundThumbnail;
  final Runs? title;

  MusicImmersiveHeaderRenderer(
      {this.description,
      this.playButton,
      this.startRadioButton,
      this.thumbnail,
      this.foregroundThumbnail,
      this.title});

  factory MusicImmersiveHeaderRenderer.fromJson(Map<String, dynamic> json) {
    return MusicImmersiveHeaderRenderer(
      description: json['description'] != null
          ? Runs.fromJson(json['description'])
          : null,
      playButton: json['playButton'] != null
          ? PlayButton.fromJson(json['playButton'])
          : null,
      startRadioButton: json['startRadioButton'] != null
          ? StartRadioButton.fromJson(json['startRadioButton'])
          : null,
      thumbnail: json['thumbnail'] != null
          ? ThumbnailRenderer.fromJson(json['thumbnail'])
          : null,
      foregroundThumbnail: json['foregroundThumbnail'] != null
          ? ThumbnailRenderer.fromJson(json['foregroundThumbnail'])
          : null,
      title: json['title'] != null ? Runs.fromJson(json['title']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (playButton != null) {
      data['playButton'] = playButton!.toJson();
    }
    if (startRadioButton != null) {
      data['startRadioButton'] = startRadioButton!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (foregroundThumbnail != null) {
      data['foregroundThumbnail'] = foregroundThumbnail!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    return data;
  }
}

class PlayButton {
  final ButtonRenderer? buttonRenderer;

  PlayButton({this.buttonRenderer});

  factory PlayButton.fromJson(Map<String, dynamic> json) {
    return PlayButton(
      buttonRenderer: json['buttonRenderer'] != null
          ? ButtonRenderer.fromJson(json['buttonRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (buttonRenderer != null) {
      data['buttonRenderer'] = buttonRenderer!.toJson();
    }
    return data;
  }
}

class StartRadioButton {
  final ButtonRenderer? buttonRenderer;

  StartRadioButton({this.buttonRenderer});

  factory StartRadioButton.fromJson(Map<String, dynamic> json) {
    return StartRadioButton(
      buttonRenderer: json['buttonRenderer'] != null
          ? ButtonRenderer.fromJson(json['buttonRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (buttonRenderer != null) {
      data['buttonRenderer'] = buttonRenderer!.toJson();
    }
    return data;
  }
}

class Microformat {
  final MicroformatDataRenderer? microformatDataRenderer;

  Microformat({this.microformatDataRenderer});

  factory Microformat.fromJson(Map<String, dynamic> json) {
    return Microformat(
      microformatDataRenderer: json['microformatDataRenderer'] != null
          ? MicroformatDataRenderer.fromJson(json['microformatDataRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'microformatDataRenderer': microformatDataRenderer?.toJson(),
    };
  }
}

class MicroformatDataRenderer {
  final String? urlCanonical;

  MicroformatDataRenderer({this.urlCanonical});

  factory MicroformatDataRenderer.fromJson(Map<String, dynamic> json) {
    return MicroformatDataRenderer(
      urlCanonical: json['urlCanonical'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'urlCanonical': urlCanonical,
    };
  }
}
