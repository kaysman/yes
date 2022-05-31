import 'dart:io';

import 'package:dio/dio.dart';


import '../constants.dart';
import '../models/promotion_model.dart';

class PromotionService {
  static Future<List<PromotionModel>?> fetchPromotions() async {
    final res = await Dio(kBaseOptions).get('/promotions');
    if (res.statusCode == HttpStatus.ok) {
      final jsonBody = PromotionsModel.fromJson(res.data);

      return jsonBody.data;
    }
  }
}
