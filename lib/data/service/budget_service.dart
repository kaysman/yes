import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';

import '../models/budget/budget.model.dart';

class BudgetService {

  static Future<List<Budget>> fetchButgets() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kAllBudgets);
      final parsedBody = await ApiClient.instance.get(uri);
      return List.from(parsedBody as List<Map<String, dynamic>>)
          .map((e) => Budget.fromJson(e))
          .toList();
    } catch (_) {
      throw _;
    }
  }

  static Future<Budget> fetchBudgetById(int id) async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kBudgetById(id));
      final parsedBody = await ApiClient.instance.get(uri);
      return  Budget.fromJson((parsedBody as Map<String, dynamic> ));
    } catch (_) {
      throw _;
    }
  }


  // static Future<Budget> fetchBudgetProducts(int id) async {
  //   try {
  //     var uri = Uri.http(Apis.kBaseUrl, Apis.kBudgetProducts(id));
  //     final parsedBody = await ApiClient.instance.get(uri);
  //     return  Budget.fromJson((parsedBody as Map<String, dynamic> ));
  //   } catch (_) {
  //     throw _;
  //   }
  // }
}
