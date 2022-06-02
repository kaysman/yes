import 'package:yes/data/models/brand/brand.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class BrandService {
  static Future<List<Brand>> fetchBrands() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kAllBrands);
      var parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody as List<Map<String, dynamic>>)
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
      return List.from(parsedBody as List<Map<String, dynamic>>)
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
      return  Brand.fromJson((parsedBody as Map<String, dynamic>));
    } catch (_) {
      throw _;
    }
  }


  // Future<List<Brand>> fetchBrandProdcuts(int id) async {
  //   try {
  //     var uri = Uri.http(Apis.kBaseUrl, Apis.kBrandProducts(id));
  //     var parsedBody = await ApiClient.instance.get(uri);
  //     return List.from(parsedBody as List<Map<String, dynamic>>)
  //         .map((e) => Brand.fromJson(e))
  //         .toList();
  //   } catch (_) {
  //     throw _;
  //   }
  // }



}
