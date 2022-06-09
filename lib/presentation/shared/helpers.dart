import 'package:flutter/material.dart';

class Apis {
  static const kBaseUrl = 'yes.com.tm';
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
