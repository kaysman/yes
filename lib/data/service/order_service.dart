import 'dart:convert';
import 'package:yes/data/models/order/create-order.model.dart';
import 'package:yes/data/models/response.dart';
import 'package:yes/presentation/shared/helpers.dart';

import 'api_client.dart';

class OrderService {
  static Future<ApiResponse> cerateOrder(
    CreateOrderDTO data,
  ) async {
    String url = Apis.kBaseUrl + '/orders/create';
    var uri = Uri.parse(url);
    try {
      var res = await ApiClient.instance.post(
        uri,
        headers: header(),
        data: jsonEncode(
          data.toJson(),
        ),
      );
      return res;
    } catch (_) {
      print(_);
      throw _;
    }
  }
}
