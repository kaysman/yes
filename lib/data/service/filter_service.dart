import 'package:yes/data/models/filter/filter.entity.model.dart';
import 'package:yes/presentation/shared/helpers.dart';

import 'api_client.dart';

class FilterService {
  static Future<List<FilterEntity>> getFilters(
    Map<String, dynamic> queryParams,
  ) async {
    String url = Apis.kBaseUrl   + '/filters?';
    queryParams.forEach((key, value) {
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
          .map((json) => FilterEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (_) {
      print(_);
      throw _;
    }
  }
}
