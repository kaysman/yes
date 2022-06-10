import 'package:yes/data/models/category/category.model.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

class CategoryService {
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

  // static Future<List<Category>?> fetchCategoryProducts(int subId) async {
  //   try {
  //     var uri = Uri.http(Apis.kBaseUrl, Apis.kCategoryProducts(subId));
  //     final parsedBody = await ApiClient.instance.get(uri);
  //     return List.from(parsedBody as List<Map<String, dynamic>>)
  //         .map((e) => Category.fromJson(e))
  //         .toList();
  //   } catch (_) {
  //     throw _;
  //   }
  // }

}
