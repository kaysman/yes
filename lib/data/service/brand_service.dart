import 'package:yes/data/models/brand-new/brand.model.dart';
import 'package:yes/data/models/brand/brand.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class BrandService {
  //new
  static Future<List<BrandEntity>> getBrands({
    Map<String, dynamic>? queryParams,
  }) async {
    String url = Apis.kBaseUrl + '/brands?';
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
          .map((json) => BrandEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (_) {
      print(_);
      throw _;
    }
  }

// old
  static Future<List<Brand>> fetchBrands() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kAllBrands);
      var parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody['data'] as List<dynamic>)
          .map((e) => Brand.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }

  static Future<List<Brand>> fetchVipBrands() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kVIPBrands);
      var parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody['data'] as List<dynamic>)
          .map((e) => Brand.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }

  static Future<Brand> fetchBrandById(int id) async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kBrandById(id));
      var parsedBody = await ApiClient.instance.get(uri);
      return Brand.fromJson((parsedBody as Map<String, dynamic>));
    } catch (_) {
      throw _;
    }
  }
}
