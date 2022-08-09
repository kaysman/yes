import 'dart:convert';
import 'package:yes/data/models/adress/create-adress.model.dart';
import 'package:yes/data/models/response.dart';
import 'package:yes/presentation/shared/helpers.dart';

import 'api_client.dart';

class AdressService {
  static Future<ApiResponse> cerateAdress(
    CreateAddressDTO data,
  ) async {
    String url = Apis.kBaseUrl + '/addresses/create';
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
