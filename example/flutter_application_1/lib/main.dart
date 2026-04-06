import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/section.dart';
import 'package:innertube_dart/models/responses/thumbnail.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/models/responses/video.dart';

void main() {
  runApp(const ApiTesterApp());
}

class ApiTesterApp extends StatelessWidget {
  const ApiTesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'innertube_dart Tester',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TesterHomePage(),
    );
  }
}

class TesterHomePage extends StatefulWidget {
  const TesterHomePage({super.key});

  @override
  State<TesterHomePage> createState() => _TesterHomePageState();
}

class _TesterHomePageState extends State<TesterHomePage> {
  final innertube = Innertube(locale: const Locale('it', 'IT'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('innertube_dart API tester'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Locale attiva: it-IT',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Seleziona un endpoint da testare. Ogni schermata permette input manuale, esecuzione chiamata, risultato e JSON completo.',
          ),
          const SizedBox(height: 16),
          _ApiEntryTile(
            title: 'getVideo',
            subtitle: 'Recupera dettagli video e URL streaming opzionale',
            onTap: () =>
                _openPage(context, VideoTestPage(innertube: innertube)),
          ),
          _ApiEntryTile(
            title: 'search',
            subtitle: 'Ricerca video/canali/playlist con continuation token',
            onTap: () =>
                _openPage(context, SearchTestPage(innertube: innertube)),
          ),
          _ApiEntryTile(
            title: 'getTrending',
            subtitle: 'Trending per categoria now/music/gaming/film',
            onTap: () =>
                _openPage(context, TrendingTestPage(innertube: innertube)),
          ),
          _ApiEntryTile(
            title: 'getPlaylist',
            subtitle: 'Dettagli playlist con caricamento video opzionale',
            onTap: () =>
                _openPage(context, PlaylistTestPage(innertube: innertube)),
          ),
          _ApiEntryTile(
            title: 'getChannel',
            subtitle: 'Dettagli canale per sezione home/videos/playlists',
            onTap: () =>
                _openPage(context, ChannelTestPage(innertube: innertube)),
          ),
          _ApiEntryTile(
            title: 'getMusicHome',
            subtitle: 'Homepage YouTube Music con carousel e sezioni',
            onTap: () =>
                _openPage(context, MusicHomeTestPage(innertube: innertube)),
          ),
          _ApiEntryTile(
            title: 'suggestQueries',
            subtitle: 'Suggerimenti di ricerca in base a query parziale',
            onTap: () => _openPage(
              context,
              SuggestQueriesTestPage(innertube: innertube),
            ),
          ),
        ],
      ),
    );
  }

  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}

class _ApiEntryTile extends StatelessWidget {
  const _ApiEntryTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class VideoTestPage extends StatefulWidget {
  const VideoTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<VideoTestPage> createState() => _VideoTestPageState();
}

class _VideoTestPageState extends State<VideoTestPage> {
  final _videoIdController = TextEditingController(text: 'dQw4w9WgXcQ');
  bool _withStreamingUrl = true;
  bool _loading = false;
  String? _error;
  Video? _result;

  @override
  void dispose() {
    _videoIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ApiTestScaffold(
      title: 'Test getVideo',
      children: [
        TextField(
          controller: _videoIdController,
          decoration: const InputDecoration(
            labelText: 'Video ID',
            hintText: 'Es: dQw4w9WgXcQ',
          ),
        ),
        SwitchListTile(
          value: _withStreamingUrl,
          onChanged:
              _loading ? null : (v) => setState(() => _withStreamingUrl = v),
          title: const Text('Recupera URL streaming'),
        ),
        FilledButton(
          onPressed: _loading ? null : _run,
          child: const Text('Esegui getVideo'),
        ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: _run,
          child: _result == null
              ? const EmptyResultHint(message: 'Nessun risultato ancora.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VideoCard(video: _result!),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _run() async {
    final videoId = _videoIdController.text.trim();
    if (videoId.isEmpty) {
      setState(() => _error = 'Inserisci un video ID valido.');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await widget.innertube.getVideo(
        videoId: videoId,
        withStreamingUrl: _withStreamingUrl,
      );

      setState(() => _result = result);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class SearchTestPage extends StatefulWidget {
  const SearchTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<SearchTestPage> createState() => _SearchTestPageState();
}

class _SearchTestPageState extends State<SearchTestPage> {
  final _queryController = TextEditingController(text: 'flutter tutorial');
  bool _loading = false;
  String? _error;
  SearchResponse? _result;
  String? _continuation;

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videos = _result?.videos ?? <Video>[];
    final channels = _result?.channels ?? <Channel>[];
    final playlists = _result?.playlists ?? <Playlist>[];

    return ApiTestScaffold(
      title: 'Test search',
      children: [
        TextField(
          controller: _queryController,
          decoration: const InputDecoration(
            labelText: 'Query',
            hintText: 'Es: flutter tutorial',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed:
                    _loading ? null : () => _runSearch(resetContinuation: true),
                child: const Text('Cerca'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: (_loading || _continuation == null)
                    ? null
                    : () => _runSearch(resetContinuation: false),
                child: const Text('Pagina successiva'),
              ),
            ),
          ],
        ),
        if (_continuation != null)
          Text(
            'Continuation disponibile: ${_continuation!.substring(0, _continuation!.length > 18 ? 18 : _continuation!.length)}...',
          ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: () => _runSearch(resetContinuation: true),
          child: _result == null
              ? const EmptyResultHint(
                  message: 'Esegui una ricerca per vedere risultati.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                    const SizedBox(height: 8),
                    _SectionTitle('Video (${videos.length})'),
                    ...videos.take(8).map((v) => VideoCard(video: v)),
                    const SizedBox(height: 8),
                    _SectionTitle('Canali (${channels.length})'),
                    ...channels.take(8).map((c) => ChannelCard(channel: c)),
                    const SizedBox(height: 8),
                    _SectionTitle('Playlist (${playlists.length})'),
                    ...playlists.take(8).map((p) => PlaylistCard(playlist: p)),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _runSearch({required bool resetContinuation}) async {
    final query = _queryController.text.trim();
    if (query.isEmpty) {
      setState(() => _error = 'Inserisci una query.');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      if (resetContinuation) {
        _continuation = null;
      }
    });

    try {
      final result = await widget.innertube.search(
        query: query,
        continuationToken: _continuation,
      );

      setState(() {
        _result = result;
        _continuation = result.continuationToken;
      });
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class TrendingTestPage extends StatefulWidget {
  const TrendingTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<TrendingTestPage> createState() => _TrendingTestPageState();
}

class _TrendingTestPageState extends State<TrendingTestPage> {
  TrendingCategory _selectedCategory = TrendingCategory.now;
  bool _loading = false;
  String? _error;
  TrendingResponse? _result;

  @override
  Widget build(BuildContext context) {
    final videos = _result?.videos ?? <Video>[];

    return ApiTestScaffold(
      title: 'Test getTrending',
      children: [
        DropdownButtonFormField<TrendingCategory>(
          initialValue: _selectedCategory,
          decoration: const InputDecoration(labelText: 'Categoria'),
          items: TrendingCategory.values
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name),
                ),
              )
              .toList(),
          onChanged: _loading
              ? null
              : (value) {
                  if (value != null) {
                    setState(() => _selectedCategory = value);
                  }
                },
        ),
        FilledButton(
          onPressed: _loading ? null : _run,
          child: const Text('Esegui getTrending'),
        ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: _run,
          child: _result == null
              ? const EmptyResultHint(message: 'Nessun risultato ancora.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                    const SizedBox(height: 8),
                    _SectionTitle('Video (${videos.length})'),
                    ...videos.take(15).map((v) => VideoCard(video: v)),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _run() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await widget.innertube.getTrending(
        trendingCategory: _selectedCategory,
      );
      setState(() => _result = result);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class PlaylistTestPage extends StatefulWidget {
  const PlaylistTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<PlaylistTestPage> createState() => _PlaylistTestPageState();
}

class _PlaylistTestPageState extends State<PlaylistTestPage> {
  final _playlistIdController =
      TextEditingController(text: 'PLn4g4V6ZEYKPRqsOT0YiD4G5em8lcI0Of');
  bool _getVideos = true;
  bool _loading = false;
  String? _error;
  Playlist? _result;

  @override
  void dispose() {
    _playlistIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videos = _result?.videos ?? <Video>[];

    return ApiTestScaffold(
      title: 'Test getPlaylist',
      children: [
        TextField(
          controller: _playlistIdController,
          decoration: const InputDecoration(
            labelText: 'Playlist ID',
          ),
        ),
        SwitchListTile(
          value: _getVideos,
          onChanged: _loading ? null : (v) => setState(() => _getVideos = v),
          title: const Text('Carica video della playlist'),
        ),
        FilledButton(
          onPressed: _loading ? null : _run,
          child: const Text('Esegui getPlaylist'),
        ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: _run,
          child: _result == null
              ? const EmptyResultHint(message: 'Nessun risultato ancora.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlaylistCard(playlist: _result!),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                    const SizedBox(height: 8),
                    _SectionTitle('Video (${videos.length})'),
                    ...videos.take(20).map((v) => VideoCard(video: v)),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _run() async {
    final playlistId = _playlistIdController.text.trim();
    if (playlistId.isEmpty) {
      setState(() => _error = 'Inserisci una playlist ID valida.');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await widget.innertube.getPlaylist(
        playlistId: playlistId,
        getVideos: _getVideos,
      );
      setState(() => _result = result);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class ChannelTestPage extends StatefulWidget {
  const ChannelTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<ChannelTestPage> createState() => _ChannelTestPageState();
}

class _ChannelTestPageState extends State<ChannelTestPage> {
  final _channelIdController =
      TextEditingController(text: 'UC_x5XG1OV2P6uZZ5FSM9Ttw');
  ChannelSection _selectedSection = ChannelSection.home;
  bool _loading = false;
  String? _error;
  Channel? _result;
  String? _continuation;

  @override
  void dispose() {
    _channelIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videos = _result?.videos ?? <Video>[];
    final playlists = _result?.playlists ?? <Playlist>[];
    final sections = _result?.sections ?? <Section>[];

    return ApiTestScaffold(
      title: 'Test getChannel',
      children: [
        TextField(
          controller: _channelIdController,
          decoration: const InputDecoration(labelText: 'Channel ID'),
        ),
        DropdownButtonFormField<ChannelSection>(
          initialValue: _selectedSection,
          decoration: const InputDecoration(labelText: 'Sezione'),
          items: ChannelSection.values
              .map(
                (section) => DropdownMenuItem(
                  value: section,
                  child: Text(section.name),
                ),
              )
              .toList(),
          onChanged: _loading
              ? null
              : (value) {
                  if (value != null) {
                    setState(() => _selectedSection = value);
                  }
                },
        ),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed:
                    _loading ? null : () => _run(resetContinuation: true),
                child: const Text('Esegui getChannel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: (_loading || _continuation == null)
                    ? null
                    : () => _run(resetContinuation: false),
                child: const Text('Pagina successiva'),
              ),
            ),
          ],
        ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: () => _run(resetContinuation: true),
          child: _result == null
              ? const EmptyResultHint(message: 'Nessun risultato ancora.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChannelCard(channel: _result!),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                    const SizedBox(height: 8),
                    _SectionTitle('Sezioni (${sections.length})'),
                    ...sections.take(10).map((s) => SectionCard(section: s)),
                    const SizedBox(height: 8),
                    _SectionTitle('Video (${videos.length})'),
                    ...videos.take(10).map((v) => VideoCard(video: v)),
                    const SizedBox(height: 8),
                    _SectionTitle('Playlist (${playlists.length})'),
                    ...playlists.take(10).map((p) => PlaylistCard(playlist: p)),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _run({required bool resetContinuation}) async {
    final channelId = _channelIdController.text.trim();
    if (channelId.isEmpty) {
      setState(() => _error = 'Inserisci un channel ID valido.');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      if (resetContinuation) {
        _continuation = null;
      }
    });

    try {
      final result = await widget.innertube.getChannel(
        channelId: channelId,
        channelSection: _selectedSection,
        continuationToken: _continuation,
      );

      setState(() {
        _result = result;
        _continuation = result.continuationToken;
      });
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class MusicHomeTestPage extends StatefulWidget {
  const MusicHomeTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<MusicHomeTestPage> createState() => _MusicHomeTestPageState();
}

class _MusicHomeTestPageState extends State<MusicHomeTestPage> {
  bool _loading = false;
  String? _error;
  MusicHomeResponse? _result;

  @override
  Widget build(BuildContext context) {
    final carousel = _result?.carouselVideos ?? <Video>[];
    final sections = _result?.sections ?? <Section>[];

    return ApiTestScaffold(
      title: 'Test getMusicHome',
      children: [
        FilledButton(
          onPressed: _loading ? null : _run,
          child: const Text('Esegui getMusicHome'),
        ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: _run,
          child: _result == null
              ? const EmptyResultHint(message: 'Nessun risultato ancora.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(_result?.title ?? 'N/A'),
                        subtitle: Text(_result?.description ?? '-'),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                    const SizedBox(height: 8),
                    _SectionTitle('Carousel (${carousel.length})'),
                    ...carousel.take(10).map((v) => VideoCard(video: v)),
                    const SizedBox(height: 8),
                    _SectionTitle('Sezioni (${sections.length})'),
                    ...sections.take(12).map((s) => SectionCard(section: s)),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _run() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await widget.innertube.getMusicHome();
      setState(() => _result = result);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class SuggestQueriesTestPage extends StatefulWidget {
  const SuggestQueriesTestPage({super.key, required this.innertube});

  final Innertube innertube;

  @override
  State<SuggestQueriesTestPage> createState() => _SuggestQueriesTestPageState();
}

class _SuggestQueriesTestPageState extends State<SuggestQueriesTestPage> {
  final _queryController = TextEditingController(text: 'elodie');
  bool _loading = false;
  String? _error;
  List<String>? _result;

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = _result ?? <String>[];

    return ApiTestScaffold(
      title: 'Test suggestQueries',
      children: [
        TextField(
          controller: _queryController,
          decoration: const InputDecoration(labelText: 'Query parziale'),
        ),
        FilledButton(
          onPressed: _loading ? null : _run,
          child: const Text('Esegui suggestQueries'),
        ),
        ResultStateBlock(
          isLoading: _loading,
          error: _error,
          onRetry: _run,
          child: _result == null
              ? const EmptyResultHint(message: 'Nessun risultato ancora.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () => showJsonDialog(context, _result),
                      child: const Text('Mostra JSON completo'),
                    ),
                    const SizedBox(height: 8),
                    _SectionTitle('Suggerimenti (${suggestions.length})'),
                    ...suggestions.map(
                      (item) => Card(
                        child: ListTile(title: Text(item)),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _run() async {
    final query = _queryController.text.trim();
    if (query.isEmpty) {
      setState(() => _error = 'Inserisci una query valida.');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await widget.innertube.suggestQueries(query: query);
      setState(() => _result = result ?? <String>[]);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }
}

class ApiTestScaffold extends StatelessWidget {
  const ApiTestScaffold({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => children[i],
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: children.length,
      ),
    );
  }
}

class ResultStateBlock extends StatelessWidget {
  const ResultStateBlock({
    super.key,
    required this.isLoading,
    required this.error,
    required this.onRetry,
    required this.child,
  });

  final bool isLoading;
  final String? error;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (error != null) {
      return Card(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Errore: $error',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: onRetry,
                child: const Text('Riprova'),
              ),
            ],
          ),
        ),
      );
    }

    return child;
  }
}

class EmptyResultHint extends StatelessWidget {
  const EmptyResultHint({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Text(message),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(label, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            ThumbnailPreview(thumbnailUrl: video.thumbnails?.firstOrNull?.url),
        title: Text(video.title ?? 'N/A'),
        subtitle: Text(
          '${video.author ?? '-'}\nviews: ${video.viewCount ?? '-'} | duration: ${video.lengthSeconds ?? '-'}s',
        ),
        isThreeLine: true,
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ThumbnailPreview(
            thumbnailUrl: playlist.thumbnails?.firstOrNull?.url),
        title: Text(playlist.title ?? 'N/A'),
        subtitle: Text(
          '${playlist.author ?? '-'}\nvideoCount: ${playlist.videoCount ?? '-'}',
        ),
        isThreeLine: true,
      ),
    );
  }
}

class ChannelCard extends StatelessWidget {
  const ChannelCard({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            ThumbnailPreview(thumbnailUrl: channel.avatars?.firstOrNull?.url),
        title: Text(channel.title ?? 'N/A'),
        subtitle: Text(
          '${channel.channelHandleText ?? '-'}\nsubscribers: ${channel.subscriberCount ?? '-'} | videos: ${channel.videoCount ?? '-'}',
        ),
        isThreeLine: true,
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(section.title ?? 'N/A'),
        subtitle: Text(
          'playlistId: ${section.playlistId ?? '-'}\nvideos: ${section.videos?.length ?? 0}, playlists: ${section.playlists?.length ?? 0}, channels: ${section.featuredChannels?.length ?? 0}',
        ),
        isThreeLine: true,
      ),
    );
  }
}

class ThumbnailPreview extends StatelessWidget {
  const ThumbnailPreview({super.key, required this.thumbnailUrl});

  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    if (thumbnailUrl == null || thumbnailUrl!.isEmpty) {
      return const SizedBox(
        width: 56,
        height: 56,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black12),
          child: Icon(Icons.image_not_supported_outlined, size: 20),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        thumbnailUrl!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const SizedBox(
          width: 56,
          height: 56,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black12),
            child: Icon(Icons.broken_image_outlined, size: 20),
          ),
        ),
      ),
    );
  }
}

void showJsonDialog(BuildContext context, dynamic value) {
  final pretty = const JsonEncoder.withIndent('  ').convert(_toJsonSafe(value));

  showDialog<void>(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('JSON completo'),
        content: SizedBox(
          width: 520,
          child: SingleChildScrollView(
            child: SelectableText(pretty),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Chiudi'),
          ),
        ],
      );
    },
  );
}

dynamic _toJsonSafe(dynamic value) {
  if (value == null || value is num || value is String || value is bool) {
    return value;
  }

  if (value is List) {
    return value.map(_toJsonSafe).toList();
  }

  if (value is Map) {
    return value.map((key, item) => MapEntry('$key', _toJsonSafe(item)));
  }

  if (value is Video) return _toJsonSafe(value.toJson());
  if (value is Channel) return _toJsonSafe(value.toJson());
  if (value is Playlist) return _toJsonSafe(value.toJson());
  if (value is SearchResponse) return _toJsonSafe(value.toJson());
  if (value is TrendingResponse) return _toJsonSafe(value.toJson());
  if (value is MusicHomeResponse) return _toJsonSafe(value.toJson());
  if (value is Section) return _toJsonSafe(value.toJson());
  if (value is Thumbnail) return _toJsonSafe(value.toJson());

  return value.toString();
}
