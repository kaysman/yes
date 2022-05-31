import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class CategoryService {
  static Future<List<Category>?> fetchCategory() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kHomeCategories);
      final parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody as List<Map<String, dynamic>>)
          .map((e) => Category.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }
}
