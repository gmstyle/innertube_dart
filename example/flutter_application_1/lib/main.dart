import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final innertube = Innertube(locale: const Locale('it', 'IT'));

  Future<Video> getVideo(String videoId) async {
    final resp = await innertube.getVideo(videoId: videoId);
    return resp;
  }

  Future<SearchResponse> search(String query) async {
    final resp = await innertube.search(query: query, continuationToken: null);
    log('Continuation: ${resp.continuationToken}');
    return resp;
  }

  Future<TrendingResponse> getTrenging() async {
    final resp = await innertube.getTrending();
    return resp;
  }

  Future<Playlist> getPlaylist(String playlistId) async {
    final resp = await innertube.getPlaylist(playlistId: playlistId);
    return resp;
  }

  Future<Channel> getChannel(String channelId) async {
    final resp = await innertube.getChannel(
        channelId: channelId,
        channelSection: ChannelSection.playlists,
        continuationToken: null);

    log('Continuation: ${resp.continuationToken}');
    return resp;
  }

  Future<MusicHomeResponse> getMusicHome() async {
    final resp = await innertube.getMusicHome();
    return resp;
  }

  Future<List<String>?> suggestQuesries(String query) async {
    final resp = await innertube.suggestQueries(query: query);
    return resp;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getVideo('nHCsuf1TVOY').then((value) => print(value.toJson()));
    search('elodie').then((value) => print(value.toJson()));
    //getTrenging().then((value) => print(value));
    /* getPlaylist('VLPLTJVqehT6SrzjjX_7jWOUMDw9kRjx7AAt')
        .then((value) => print(value.toJson())); */
    /* getChannel('UC9C9A0BYvdGO_I1IwctjWGg')
        .then((value) => print(value.toJson())); */
    //getMusicHome().then((value) => print(value.toJson()));
    //suggestQuesries('elodie').then((value) => print(value));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
