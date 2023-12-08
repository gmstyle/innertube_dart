import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/video.dart';

class ChannelResponse {
  final String? channelId;
  final String? title;
  final String? channelHandleText;
  final List<dynamic> avatars;
  final List<dynamic> banners;
  final List<dynamic> tvBanners;
  final List<Video> videos;
  final List<Playlist> playlists;
}
