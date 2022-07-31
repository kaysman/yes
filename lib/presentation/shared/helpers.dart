import 'package:flutter/material.dart';

Map<String, String> header() {
  return {
    "Content-Type": "application/json",
    "Accept": "*/*",
  };
}

class Apis {
  static const kBaseUrl = 'http://192.168.1.3:3333';
  // http://yes.com.tm/api/front

  // auth
  static const kLogin = '/api/front/login';
  static const kRegister = '/register';

  // categories
  static const kHomeCategories = '/api/front/home_categories';
  static const kTabCategories = '/api/front/tab_categories';
  static kCategoryById(int subId) => "/api/front/category/:$subId";
  static kCategoryProducts(int subId) => "/api/front/category/:$subId/products";

  // promotions
  static const kAllPromotions = '/api/front/promotions';
  static kPromotionProducts(int? id) => "/api/front/promotion/$id/products";

  // brands
  static const kAllBrands = '/api/front/brands';
  static const kVIPBrands = '/api/front/vip/brands';
  static kBrandById(int id) => "/api/front/brand/$id";
  static kBrandProducts(int id) => "/api/front/brand/$id/products";

  // budgets
  static const kAllBudgets = '/api/front/budgets';
  static kBudgetById(int id) => '/api/front/budget/$id';
  static kBudgetProducts(int id) => '/api/front/budget/$id/products';

  // products
  static kProductById(int id) => '/api/front/product/$id';
}

enum SnackbarType { success, error }

void showSnackBar(
  BuildContext context,
  Widget child, {
  SnackbarType type = SnackbarType.error,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor != null
          ? backgroundColor
          : type == SnackbarType.error
              ? Color(0xffdf4759)
              : Color(0xFF15AA40),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: child,
    ),
  );
}

List<Map<String, dynamic>> menuItems = [
  {
    "activeIcon": Icon(Icons.home),
    "icon": Icon(Icons.home_outlined),
    "label": 'Home'
  },
  {
    "activeIcon": Icon(Icons.category_rounded),
    "icon": Icon(Icons.category_outlined),
    "label": 'Categories'
  },
  {
    "activeIcon": Icon(Icons.shopping_bag),
    "icon": Icon(Icons.shopping_bag_outlined),
    "label": 'Shopping bag'
  },
  {
    "activeIcon": Icon(Icons.person),
    "icon": Icon(Icons.person_outline),
    "label": 'Profile'
  },
];

List<Color> bgColors = [
  Colors.pinkAccent.withOpacity(.1),
  Colors.amber.withOpacity(.1),
  Colors.lightGreen.withOpacity(.1).withOpacity(.1),
  Colors.blueAccent.withOpacity(.1),
];
