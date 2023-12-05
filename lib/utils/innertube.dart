import 'package:innertube_dart/configuration/protocols.dart';
import 'package:innertube_dart/innertube_adaptor.dart';

class Client {
  final Adaptor adaptor;

  Client(this.adaptor);

  Future<Map<String, dynamic>> call(String endpoint,
      {Map<String, dynamic>? params, Map<String, dynamic>? body}) async {
    final response =
        await adaptor.dispatch(endpoint, params: params, body: body);

    final processedResponse = response.remove('responseContext');

    return processedResponse;
  }
}
