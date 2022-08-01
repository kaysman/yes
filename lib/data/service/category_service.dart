import 'package:yes/data/models/category-new/category.model.dart';
import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class CategoryService {
  // new
  static Future<List<CategoryEntity>> getCategories({
    Map<String, dynamic>? queryParams,
  }) async {
    String url = Apis.kBaseUrl + '/categories?';
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
      print(res.data.toString());

      return (res.data as List)
          .map((json) => CategoryEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (_) {
      print(_);
      throw _;
    }
  }

  static Future<List<Category>?> fetchHomeCategories() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kHomeCategories);
      final parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }

  static Future<List<Category>?> fetchTabCategories() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kTabCategories);
      final parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }

  static Future<Category> fetchCategoryById(int id) async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kCategoryById(id));
      final parsedBody = await ApiClient.instance.get(uri);
      return Category.fromJson((parsedBody as Map<String, dynamic>));
    } catch (_) {
      throw _;
    }
  }
}
