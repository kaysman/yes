import 'package:yes/data/models/brand/brand.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class BrandService {
  Future<List<Brand>> fetchBrands() async {
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
}
