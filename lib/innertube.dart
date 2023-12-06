import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/models/responses/player_response/player_response.dart';

class Innertube extends InnertubeAdaptor {
  Innertube();

  // player call
  Future<PlayerResponse> player(String videoId) async {
    final endpoint = Endpoint.player.name;
    final params = {
      'videoId': videoId,
    };

    final response = await dispatch(endpoint, params: params);

    final pr = PlayerResponse.fromMap(response);
    return pr;
  }
}
