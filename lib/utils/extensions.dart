import 'package:innertube_dart/models/section_list_renderer.dart'
    as section_list_renderer;
import 'package:innertube_dart/models/section_list_renderer.dart';

extension WindowedExtension<T> on List<T> {
  List<List<T>> windowed(int size, int step) {
    List<List<T>> result = [];
    for (int i = 0; i < size * step; i += step) {
      if (i + size > length) break;
      result.add(sublist(i, i + size));
    }
    return result;
  }
}

extension SectionListRendererExtension on SectionListRenderer {
  section_list_renderer.Content? findSectionByTitle(String title) {
    return contents?.firstWhere((element) {
      final text = element.musicCarouselShelfRenderer?.header
              ?.musicCarouselShelfBasicHeaderRenderer?.title ??
          element.musicShelfRenderer?.title;

      return text == text;
    });
  }

  section_list_renderer.Content? findSectionByStrapLine(String text) {
    return contents?.firstWhere((element) {
      final strapLine = element
          .musicCarouselShelfRenderer
          ?.header
          ?.musicCarouselShelfBasicHeaderRenderer
          ?.strapline
          ?.runs
          .firstOrNull
          ?.text;

      return strapLine == text;
    });
  }
}
