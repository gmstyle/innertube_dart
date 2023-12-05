abstract class Adaptor {
  /// Effettua una chiamata a un endpoint.
  ///
  /// [endpoint] L'endpoint a cui effettuare la chiamata.
  /// [params] Una mappa facoltativa di parametri da inviare all'endpoint.
  /// [body] Una mappa facoltativa di dati da inviare all'endpoint.
  ///
  /// Restituisce una mappa con i dati ricevuti dall'endpoint.
  Future<Map<String, dynamic>> dispatch(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  });
}
