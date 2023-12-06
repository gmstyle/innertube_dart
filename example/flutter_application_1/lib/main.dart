import 'package:flutter/material.dart';
import 'package:innertube_dart/innertube.dart';
import 'package:innertube_dart/models/responses/home_response.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
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
  final innertube = Innertube();

  Future<Video> getVideo(String videoId) async {
    final resp = await innertube.getVideo(videoId: videoId);
    return resp;
  }

  Future<SearchResponse> search(String query) async {
    final resp = await innertube.search(query: query);
    return resp;
  }

  Future<HomeResponse> getHome() async {
    final resp = await innertube.getHomeContent();
    return resp;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getVideo('nHCsuf1TVOY').then((value) => print(value.toJson()));
    //search('elodie').then((value) => print(value.toJson()));
    getHome().then((value) => print(value));
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
