import 'dart:convert';

import 'description.dart';
import 'embed.dart';
import 'thumbnail.dart';
import 'title.dart';

class PlayerMicroformatRenderer {
  Thumbnail? thumbnail;
  Embed? embed;
  Title? title;
  Description? description;
  String? lengthSeconds;
  String? ownerProfileUrl;
  String? externalChannelId;
  bool? isFamilySafe;
  List<dynamic>? availableCountries;
  bool? isUnlisted;
  bool? hasYpcMetadata;
  String? viewCount;
  String? category;
  String? publishDate;
  String? ownerChannelName;
  String? uploadDate;

  PlayerMicroformatRenderer({
    this.thumbnail,
    this.embed,
    this.title,
    this.description,
    this.lengthSeconds,
    this.ownerProfileUrl,
    this.externalChannelId,
    this.isFamilySafe,
    this.availableCountries,
    this.isUnlisted,
    this.hasYpcMetadata,
    this.viewCount,
    this.category,
    this.publishDate,
    this.ownerChannelName,
    this.uploadDate,
  });

  factory PlayerMicroformatRenderer.fromMap(Map<String, dynamic> data) {
    return PlayerMicroformatRenderer(
      thumbnail: data['thumbnail'] == null
          ? null
          : Thumbnail.fromMap(data['thumbnail'] as Map<String, dynamic>),
      embed: data['embed'] == null
          ? null
          : Embed.fromMap(data['embed'] as Map<String, dynamic>),
      title: data['title'] == null
          ? null
          : Title.fromMap(data['title'] as Map<String, dynamic>),
      description: data['description'] == null
          ? null
          : Description.fromMap(data['description'] as Map<String, dynamic>),
      lengthSeconds: data['lengthSeconds'] as String?,
      ownerProfileUrl: data['ownerProfileUrl'] as String?,
      externalChannelId: data['externalChannelId'] as String?,
      isFamilySafe: data['isFamilySafe'] as bool?,
      availableCountries: data['availableCountries'] as List<dynamic>?,
      isUnlisted: data['isUnlisted'] as bool?,
      hasYpcMetadata: data['hasYpcMetadata'] as bool?,
      viewCount: data['viewCount'] as String?,
      category: data['category'] as String?,
      publishDate: data['publishDate'] as String?,
      ownerChannelName: data['ownerChannelName'] as String?,
      uploadDate: data['uploadDate'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'thumbnail': thumbnail?.toMap(),
        'embed': embed?.toMap(),
        'title': title?.toMap(),
        'description': description?.toMap(),
        'lengthSeconds': lengthSeconds,
        'ownerProfileUrl': ownerProfileUrl,
        'externalChannelId': externalChannelId,
        'isFamilySafe': isFamilySafe,
        'availableCountries': availableCountries,
        'isUnlisted': isUnlisted,
        'hasYpcMetadata': hasYpcMetadata,
        'viewCount': viewCount,
        'category': category,
        'publishDate': publishDate,
        'ownerChannelName': ownerChannelName,
        'uploadDate': uploadDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerMicroformatRenderer].
  factory PlayerMicroformatRenderer.fromJson(String data) {
    return PlayerMicroformatRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerMicroformatRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
