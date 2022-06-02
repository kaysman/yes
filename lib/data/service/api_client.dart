import 'dart:convert';

import 'package:http/http.dart';

class ApiClient {
  late Client client;

  ApiClient._setHttpClient() {
    client = Client();
  }

  static final instance = ApiClient._setHttpClient();

  // get
  get(Uri url, {Map<String, String>? headers}) async {
    var res = await client.get(url, headers: headers);
    return json.decode(res.body);
  }

  // post
  post(Uri url, {Map<String, String>? headers, dynamic data}) async {
    var res = await client.post(url, headers: headers, body: data);
    return json.decode(res.body);
  }
}
