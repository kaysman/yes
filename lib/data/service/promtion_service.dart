import 'package:yes/data/models/promotion/promotion.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class PromotionService {
  static Future<List<Promotion>> fetchPromotions() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kAllPromotions);
      final parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody as List<Map<String, dynamic>>).map((e) => Promotion.fromJson(e)).toList();
    } catch (_) {
      throw _;
    }
  }
}
