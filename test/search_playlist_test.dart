import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/requests/search_request.dart';
import 'package:innertube_dart/utils/utils.dart';

void main() {
  group('Search Response Parsing', () {
    test('should parse playlists from search.json with lockupViewModel',
        () async {
      // Legge il file search.json
      final file = File('search.json');
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString);

      // Simula il comportamento della SearchRequest
      final contents = jsonData['contents']['twoColumnSearchResultsRenderer']
          ['primaryContents']['sectionListRenderer']['contents'];

      final itemSectionRenderer = Utils.filterSearchContents(contents);
      final continuationItemRenderer =
          (contents as List<dynamic>).last['continuationItemRenderer'];

      final data = {
        'contents': itemSectionRenderer,
        'continuationItemRenderer': continuationItemRenderer
      };

      // Usa il mapper per convertire i dati
      final mapper = SearchResponseMapper();
      final searchResponse = mapper.toModel(data);

      // Verifica che ci siano playlist
      expect(searchResponse.playlists, isNotNull);
      expect(searchResponse.playlists!, isNotEmpty,
          reason: 'Should find playlists in search results');

      print('Found ${searchResponse.playlists?.length ?? 0} playlists');
      print('Found ${searchResponse.videos?.length ?? 0} videos');
      print('Found ${searchResponse.channels?.length ?? 0} channels');

      // Stampa i dettagli della prima playlist se trovata
      if (searchResponse.playlists != null &&
          searchResponse.playlists!.isNotEmpty) {
        final firstPlaylist = searchResponse.playlists!.first;
        print('First playlist:');
        print('  ID: ${firstPlaylist.playlistId}');
        print('  Title: ${firstPlaylist.title}');
        print('  Author: ${firstPlaylist.author}');
        print('  Video Count: ${firstPlaylist.videoCount}');
      }
    });

    test('should find playlists in real search API call', () async {
      // Crea un'istanza di SearchRequest con locale italiano
      final searchRequest = SearchRequest(locale: const Locale('it', 'IT'));

      try {
        // Esegue la ricerca reale
        final searchResponse =
            await searchRequest.search(query: 'turbe giovanili');

        // Verifica che la risposta non sia null
        expect(searchResponse, isNotNull);

        print('=== Real Search Results ===');
        print('Found ${searchResponse.playlists?.length ?? 0} playlists');
        print('Found ${searchResponse.videos?.length ?? 0} videos');
        print('Found ${searchResponse.channels?.length ?? 0} channels');
        print(
            'Continuation token: ${searchResponse.continuationToken != null ? 'Present' : 'None'}');

        // Verifica che ci siano risultati
        final totalResults = (searchResponse.playlists?.length ?? 0) +
            (searchResponse.videos?.length ?? 0) +
            (searchResponse.channels?.length ?? 0);
        expect(totalResults, greaterThan(0),
            reason: 'Should find at least some results');

        // Stampa i dettagli delle playlist trovate
        if (searchResponse.playlists != null &&
            searchResponse.playlists!.isNotEmpty) {
          print('\n=== Playlists Found ===');
          for (int i = 0; i < searchResponse.playlists!.length; i++) {
            final playlist = searchResponse.playlists![i];
            print('Playlist ${i + 1}:');
            print('  ID: ${playlist.playlistId}');
            print('  Title: ${playlist.title}');
            print('  Author: ${playlist.author}');
            print('  Video Count: ${playlist.videoCount}');
            print('  Thumbnails: ${playlist.thumbnails?.length ?? 0}');
            print('');
          }

          // Verifica che almeno una playlist abbia i dati essenziali
          final firstPlaylist = searchResponse.playlists!.first;
          expect(firstPlaylist.playlistId, isNotNull);
          expect(firstPlaylist.playlistId, isNotEmpty);
          expect(firstPlaylist.title, isNotNull);
          expect(firstPlaylist.title, isNotEmpty);
        } else {
          print('No playlists found in real search');
        }

        // Stampa alcuni video se presenti
        if (searchResponse.videos != null &&
            searchResponse.videos!.isNotEmpty) {
          print('\n=== First Few Videos ===');
          final videosToShow = searchResponse.videos!.take(3);
          for (int i = 0; i < videosToShow.length; i++) {
            final video = videosToShow.elementAt(i);
            print('Video ${i + 1}: ${video.title}');
          }
        }

        // Stampa i canali se presenti
        if (searchResponse.channels != null &&
            searchResponse.channels!.isNotEmpty) {
          print('\n=== Channels Found ===');
          for (int i = 0; i < searchResponse.channels!.length; i++) {
            final channel = searchResponse.channels![i];
            print('Channel ${i + 1}: ${channel.title}');
          }
        }
      } catch (e) {
        print('Error during real search: $e');
        // Il test fallisce se c'è un errore, ma stampa il dettaglio
        fail('Real search failed with error: $e');
      }
    });
  });
}
