import 'package:flutter/cupertino.dart';
import 'package:yes_demo/models/promotion_model.dart';
import 'package:yes_demo/service/promtion_service.dart';

class PromotionProvider with ChangeNotifier{
  
  List<PromotionModel>? promotions;
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  PromotionProvider() {
    fetchPromotions();
  }

  Future<void> fetchPromotions() async {
    changeLoading();
    promotions = await PromotionService.fetchPromotions() ?? [];
    changeLoading();
  }
}