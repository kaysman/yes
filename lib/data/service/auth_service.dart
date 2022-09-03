import 'dart:convert';
import 'dart:developer';

import 'package:yes/data/models/auth/login_request.model.dart';
import 'package:yes/data/models/response.dart';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/storage.dart';
import '../models/client/client.model.dart';

class AuthService {
  static Future<ApiResponse> login(LoginDTO data) async {
    try {
      var uri = Uri.parse(Apis.kBaseUrl + '/auth/signin');
      // var body = {"phone": phone, "password": password};
      var res = await ApiClient.instance.post(
        uri,
        headers: header(),
        data: jsonEncode(
          data.toJson(),
        ),
      );
      var storage = await LocalStorage.instance;
      storage.setToken = res.data['access_token'];

      // storage.setClient = res['client'];
      // var user = await getUser();
      // return Client.fromJson(res['client']);
      return res;
    } catch (_) {
      throw _;
    }
  }

  static Future<Client> register() async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kLogin);
      var parsedBody = await ApiClient.instance.get(uri);
      return Client.fromJson(parsedBody);
    } catch (_) {
      throw _;
    }
  }
}
