import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/components/icons.dart';

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

void showAppBottomSheet(
  BuildContext context,
  Widget body,
) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return body;
    },
  );
}

List<Map<String, dynamic>> menuItems = [
  {
    "activeIcon": Image.asset(
      AppIcons.home,
      width: 24,
      height: 24,
      color: kPrimaryColor,
    ),
    "icon": Image.asset(
      AppIcons.home,
      width: 24,
      height: 24,
    ),
    "label": 'Esasy sahypa'
  },
  {
    "activeIcon": AppIcons.svgAsset(
      AppIcons.category,
      color: kPrimaryColor,
    ),
    "icon": AppIcons.svgAsset(
      AppIcons.category,
    ),
    "label": 'Kategoriýalar'
  },
  {
    "activeIcon": Image.asset(
      AppIcons.bag,
      width: 24,
      height: 24,
      color: kPrimaryColor,
    ),
    "icon": Image.asset(
      AppIcons.bag,
      width: 24,
      height: 24,
    ),
    "label": 'Sebet'
  },
  {
    "activeIcon": Image.asset(
      AppIcons.profile,
      width: 24,
      height: 24,
      color: kPrimaryColor,
    ),
    "icon": Image.asset(
      AppIcons.profile,
      width: 24,
      height: 24,
    ),
    "label": 'Profil'
  },
];
