import 'dart:convert';
import 'package:yes/data/service/api_client.dart';
import 'package:yes/presentation/shared/helpers.dart';
import 'package:yes/presentation/shared/storage.dart';
import '../models/client/client.model.dart';

class AuthService {
  static Future<Client> login(String phone, String password) async {
    try {
      var uri = Uri.http(Apis.kBaseUrl, Apis.kLogin);
      var body = {"phone": phone, "password": password};
      var parsedBody = await ApiClient.instance.post(uri, data: body);
      var storage = await LocalStorage.instance;
      storage.setToken = parsedBody['token'];
      storage.setClient = parsedBody['client'];
      return Client.fromJson(parsedBody['client']);
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
