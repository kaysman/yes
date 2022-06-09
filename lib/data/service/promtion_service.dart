import 'package:yes/data/models/product/products.model.dart';
import 'package:yes/data/models/promotion/promotion.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';


class PromotionService {
  static Future<List<Promotion>> fetchPromotions() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kAllPromotions);
      final parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody['data'] as List<dynamic>)
          .map((e) => Promotion.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }

  static Future<Products> fetchPromotionProducts(int? id) async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kPromotionProducts(id));
      final parsedBody = await ApiClient.instance.get(uri);
      return Products.fromJson(parsedBody['data'] as Map<String, dynamic>);
    } catch (_) {
      throw _;
    }
  }
}
