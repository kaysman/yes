import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:yes/presentation/shared/helpers.dart';

class ApiClient {
  late Client client;
  // late Client client;
  late Dio dio;

  ApiClient._setHttpClient() {
    client = Client();
    dio = Dio(BaseOptions(baseUrl: Apis.kBaseUrl));
  }

  static final instance = ApiClient._setHttpClient();

  // get
  get(Uri url, {Map<String, String>? headers}) async {
    try {
      var res = await client.get(url, headers: headers);
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
    } catch (_) {
      throw _;
    }
  }

  // post
  post(Uri url, {Map<String, String>? headers, dynamic data}) async {
    var res = await client.post(url, headers: headers, body: data);
    // print(res.body);
    if (res.statusCode == 200) {
      print(json.decode(res.body));
      return json.decode(res.body);
    }
  }

  dioPost(String path, dynamic data) async {
    try {
      var res = await dio.post(path, data: data);
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (_) {
      throw _;
    }
  }
}
