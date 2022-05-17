import 'package:flutter/cupertino.dart';
import 'package:yes_demo/models/brands_model.dart';
import 'package:yes_demo/service/brand_service.dart';


class BrandProvider with ChangeNotifier {
  List<BrandModel>? brands;

  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  BrandProvider() {
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    changeLoading();
    brands = await BrandService.fetchBrandList();
    changeLoading();
  }
}
