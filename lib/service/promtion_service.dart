import 'dart:io';

import 'package:dio/dio.dart';
import 'package:yes_demo/data/constants.dart';
import 'package:yes_demo/models/promotion_model.dart';

class PromotionService {
  static Future<List<PromotionModel>?> fetchPromotions() async {
    final res = await Dio(kBaseOptions).get('/promotions');
    // print(res.data);
    if (res.statusCode == HttpStatus.ok) {
      final jsonBody = PromotionsModel.fromJson(res.data);

      return jsonBody.data;
    }
  }
}
