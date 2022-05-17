import 'package:flutter/cupertino.dart';
import 'package:yes_demo/service/category_service.dart';
import '../models/categories_model.dart';

class CategoryProvider with ChangeNotifier {

  List<CategoryModel>? categories;
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  CategoryProvider() {
    fetchCategoryList();
  }

  Future<void> fetchCategoryList() async {
    changeLoading();
    categories = await CategoryReqresService.fetchCategoryList() ?? [];
    changeLoading();
  }
}
