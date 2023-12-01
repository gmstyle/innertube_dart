extension WindowedExtension<T> on List<T> {
  List<List<T>> windowed(int size, int step) {
    List<List<T>> result = [];
    for (int i = 0; i < size * step; i += step) {
      if (i + size > this.length) break;
      result.add(this.sublist(i, i + size));
    }
    return result;
  }
}
