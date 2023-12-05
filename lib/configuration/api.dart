import 'package:innertube_dart/configuration/configuration.dart';
import 'package:innertube_dart/models/client_context.dart';
import 'package:innertube_dart/models/response_context.dart';
import 'package:innertube_dart/models/error.dart' as error;

class Api {
  static ClientContext? getContext(String? clientName) {
    for (ClientContext context in config.clients) {
      if (context.clientName.toUpperCase() == clientName?.toUpperCase()) {
        return context;
      }
    }

    return null;
  }

  static ResponseFingerprint? getFingerPrint(Map<String, dynamic> data) {
    ResponseContext? responseContext = getResponseContext(data);
    if (responseContext == null) {
      return null;
    }

    return ResponseFingerprint(
      request: responseContext.request.type,
      function: responseContext.function,
      browseId: responseContext.browseId,
      context: responseContext.context,
      client: responseContext.client.name,
    );
  }

  static ResponseContext? getResponseContext(Map<String, dynamic> data) {
    // verifica se data contiene la chiave 'responseContext'
    // se non la contiene ritorna null
    Map? responseContext = data['responseContext'];
    if (responseContext == null) {
      return null;
    }

    Map<String, dynamic> services = {};

    for (final tracker in responseContext['serviceTrackingParams']) {
      for (final param in tracker['params']) {
        services['${tracker['service']}'][param['key']] = param['value'];
      }
    }

    String? requestType;
    String? requestId;
    // prendo la mappa alla chiave 'CSI'
    final Map<String, dynamic> service = services['CSI'];
    // itero la mappa
    service.forEach((key, value) {
      // per ogni chiave controllo se matcha con la regex r"Get(.+)_rid"
      final match = RegExp(r"Get(.+)_rid").firstMatch(key);
      // se matcha prendo il gruppo 1 e lo assegno a requestType
      // e il valore della chiave a requestId
      if (match != null) {
        requestType = match.group(1);
        requestId = value;
      }
    });

    return ResponseContext(
        function: service['yt_fn'],
        browseId: services['GFEEDBACK']['browse_id'],
        context: services['GFEEDBACK']['context'],
        visitorData: responseContext['visitorData'],
        request: Request(type: requestType, id: requestId),
        client: Client(name: service['c'], version: service['cver']),
        flags: Flags(isLoggedin: services['GFEEDBACK']['logged_in'] ?? bool));
  }

  static error.Error getError(Map<String, dynamic> data) {
    return error.Error(
      code: data['code'],
      message: data['message'],
      reason: data['status'],
    );
  }

  static Map<String, dynamic> contextualise(
      ClientContext clientContext, Map<String, dynamic> data) {
    // verifica se data contiene la chiave 'context'
    // se non la contiene la aggiunge
    if (!data.containsKey('context')) {
      data['context'] = {};
    }

    // verifica se data['context'] contiene la chiave 'client'
    // se non la contiene la aggiunge
    if (!data['context'].containsKey('client')) {
      data['context']['client'] = {};
    }

    // aggiunge i dati del clientContext a data['context']['client']
    data['context']['client'] = clientContext.context;
    return data;
  }
}
