import 'package:flutter/material.dart';

class Apis {
  static const kBaseUrl = 'http://yes.com.tm/api/front';

  // auth
  static const kLogin = '/login';
  static const kRegister = '/register';

  // categories
  static const kHomeCategories = '/home_categories';
  static const kTabCategories = '/tab_categories';
  static kCategoryById(int subId) => "/category/:$subId";
  static kCategoryProducts(int subId) => "/category/:$subId/products";

  // promotions
  static const kAllPromotions = '/promotions';
  static kPromotionProducts(int id) => "/promotion/$id/products";

  // brands
  static const kAllBrands = '/brands';
  static const kVIPBrands = '/vip/brands';
  static kBrandById(int id) => "/brand/$id";
  static kBrandProducts(int id) => "/brand/$id/products";

  // budgets
  static const kAllBudgets = '/budgets';
  static kBudgetById(int id) => '/budget/$id';
  static kBudgetProducts(int id) => '/budget/$id/products';

  // products
  static kProductById(int id) => '/product/$id';
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
