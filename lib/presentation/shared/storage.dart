import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes/data/models/client/client.model.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorage> get instance async {
    _instance = _instance ?? LocalStorage();
    _preferences = _preferences ?? (await SharedPreferences.getInstance());
    return _instance!;
  }

  set setToken(String value) {
    _preferences!.setString("token", value);
  }

  String? get getToken => _preferences!.getString("token");
  Future<bool>  get removeToken => _preferences!.remove('token');

  // set setClient(Client value) {
  //   _preferences!.setString("client", json.encode(value.toJson()));
  // }
  set setClient(Map<String, dynamic> value) {
    _preferences!.setString("client", json.encode(value));
  }

  Client? get getClient {
    var client = _preferences!.getString("client");
    return client == null ? null : Client.fromJson(json.decode(client));
  }
}
