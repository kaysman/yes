import 'dart:io';
import 'package:dio/dio.dart';
import '../constants.dart';
import '../models/brands_model.dart';


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
