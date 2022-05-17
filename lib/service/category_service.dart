import 'dart:io';

import 'package:dio/dio.dart';
import 'package:yes_demo/data/constants.dart';
import 'package:yes_demo/models/categories_model.dart';


 class CategoryReqresService {

  static Future<List<CategoryModel>?> fetchCategoryList() async {
    final res = await Dio(kBaseOptions).get('/tab_categories');
    if (res.statusCode == HttpStatus.ok) {
      final jsonBody = CategoriesModel.fromJson(res.data);
      return jsonBody.data;
    }
    return null;
  }

 

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
