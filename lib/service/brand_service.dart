import 'dart:io';

import 'package:dio/src/dio.dart';
import 'package:yes_demo/data/constants.dart';
import 'package:yes_demo/models/brands_model.dart';

class BrandService {
  static Future<List<BrandModel>?> fetchBrandList() async {
    final res = await Dio(kBaseOptions).get('/brands');
    if (res.statusCode == HttpStatus.ok) {
      final jsonBody = BrandsModel.fromJson(res.data);
      return jsonBody.data;
    }
    return null;
  }

}
