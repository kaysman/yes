import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

import '../models/product -new/product.model.dart';

class ProductsService {
  static Future<ProductEntity?> getProductById(int id) async {
    var uri = Uri.parse(Apis.kBaseUrl + '/products/$id');
    try {
      var res = await ApiClient.instance.get(uri, headers: header());
      return ProductEntity.fromJson(res.data);
    } catch (_) {
      print(_);
      throw _;
    }
  }

  static Future<List<ProductEntity>> getProducts({
    Map<String, dynamic>? queryParams,
    String? link,
  }) async {
    String url = Apis.kBaseUrl + '${link != null ? link : '/products'}?';
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
          .map((json) => ProductEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (_) {
      print(_);
      throw _;
    }
  }
}
