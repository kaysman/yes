import 'package:yes/data/models/promotion/promotion.model.dart';
import 'package:yes/presentation/shared/helpers.dart';

class PromotionService {
  static Future<List<Promotion>> fetchPromotions() async {
    try {
      
      var uri = Uri.http(Apis.kBaseUrl, Apis.kAllPromotions);
      final parsedBody = await 
    } catch (_) {}
  }
}
