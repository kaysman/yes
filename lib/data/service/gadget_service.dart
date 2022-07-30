import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

import '../models/gadget/gadget.model.dart';

class GadgetService {
  static Future<List<GadgetEntity>> getAllGadgets(
      {Map<String, dynamic>? queryParams}) async {
    String url = Apis.kBaseUrl + '/gadgets?';
    queryParams?.forEach((key, value) {
      if (key != null && value != null) {
        url += url.endsWith('?')
            ? '${key}=${queryParams[key]}'
            : '&${key}=${queryParams[key]}';
      }
    });
    var uri = Uri.parse(url);
    try {
      var res = await ApiClient.instance.get(uri, headers: header());
      return (res.data as List)
          .map((json) => GadgetEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (_) {
      print(_);
      throw _;
    }
  }

  // static Future<GadgetEntity> getGadgetById(int id) async {
  //   var uri = Uri.parse(baseUrl + '/gadgets/$id');
  //   try {
  //     var res = await ApiClient.instance.get(uri, headers: header());
  //     return GadgetEntity.fromJson(res.data);
  //   } catch (_) {
  //     print(_);
  //     throw _;
  //   }
  // }
}
