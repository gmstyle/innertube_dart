class Utils {
  // Filtro la mappa per rimuovere le chiavi con valore null
  static Map<String, dynamic> filterNull(Map<String, dynamic> map) {
    return map..removeWhere((key, value) => value == null);
  }
}
